import * as Yup from 'yup';

export const editEmployeeSchema = Yup.object({
    firstName: Yup.string().required("* First name is required"),
    lastName: Yup.string().required("* Last name is required"),
    gender: Yup.string().notOneOf(['Choose...'], '* Please select a gender').required(),
    maritalStatus: Yup.string().notOneOf(['Choose...'], '* Please select a marital status').required(),
    birthday: Yup.date().required('* Birthday is required'),
    contact: Yup.array().of(Yup.string().max(15, '* Contact number is too long').required('* Contact number is required')),
    email: Yup.string().email('* Email must be a valid email'),
    employmentStatus: Yup.string().notOneOf(['Choose...'], '* Please select a employment status').required(),
    jobTitle: Yup.string().notOneOf(['Choose...'], '* Please select a job title').required(),
    payGrade: Yup.string().notOneOf(['Choose...'], '* Please select a pay grade').required(),
    branch: Yup.string().notOneOf(['Choose...'], '* Please select a branch').required(),
    department: Yup.string().notOneOf(['Choose...'], '* Please select a department').required(),

    dFirstName: Yup.string().required('* First name is required'),
    dLastName: Yup.string().required('* Last name is required'),
    dGender: Yup.string().notOneOf(['Choose...'], '* Please select a gender').required('* Gender is required'),
    age: Yup.number().required('* Age is required'),
    relation: Yup.string().required('* Relation is required')
    
  });

