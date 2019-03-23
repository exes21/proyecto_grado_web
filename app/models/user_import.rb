class UserImport
  include ActiveModel::Model
  require 'roo'

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = header_translate(spreadsheet.row(1))
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = User.find_by_id(row["id"]) || User.new
      user.attributes = row.to_hash
      user.role = Role.find_by(name: 'Estudiante')
      user.save
    end
  end

  def self.header_translate(spreadsheet)
    result = []
    spreadsheet.each do |word|
      case word
        when 'nombre' then result << 'name'
        when 'matricula' then result << 'id_number'
        when 'email' then result << 'email'
        when 'password' then result << 'password'
      end
    end
    result
  end

end