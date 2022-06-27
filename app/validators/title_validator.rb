class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title.starts_with?(/^The.*/)
          record.errors[:title] << "Only accept the title starting with The"
        end
    end
end