import * as Yup from 'yup';

export const addEmployeeSchema = Yup.object({
    firstName: Yup.string().required(),
    lastName: Yup.string().required(),
    gender: Yup.string().required(),
    maritalStatus: Yup.string().required(),
    birthday: Yup.date().required(),
    email: Yup.string().email().required(),
    employmentStatus: Yup.string().required(),
    jobTitle: Yup.string().required(),
    payGrade: Yup.string().required(),
    branch: Yup.string().required(),
    department: Yup.string().required(),
    username: Yup.string().required(),
    password: Yup.string().required(),
    confirmPassword: Yup.string().oneOf([Yup.ref('password'), null], 'Passwords must match'),
});

