import from .service {
    validate_code_service,
    format_code_service,
    explain_code_error_service
}

import from .utils { empty_code_response, empty_error_message_response }

walker:pub validate_code {
    has code: str;

    can handle with root entry {
        if self.code.strip() == "" {
            report empty_code_response("validate_jac");
            disengage;
        }

        result = validate_code_service(self.code);
        report result;
    }
}

walker:pub format_code {
    has code: str;

    can handle with root entry {
        if self.code.strip() == "" {
            report empty_code_response("format_jac");
            disengage;
        }

        result = format_code_service(self.code);
        report result;
    }
}

walker:pub explain_code_error {
    has error_message: str;

    can handle with root entry {
        if self.error_message.strip() == "" {
            report empty_error_message_response();
            disengage;
        }

        result = explain_code_error_service(self.error_message);
        report result;
    }
}
