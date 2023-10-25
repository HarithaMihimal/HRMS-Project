import * as Yup from 'yup';

export const addHRSchema = Yup.object({
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
    
    username: Yup.string().required('* Username is required'),
    password: Yup.string().required('* Password is required'),
    confirmPassword: Yup.string().oneOf([Yup.ref('password'), null], '* Passwords must match').required('* Confirm password is required'),
  });

