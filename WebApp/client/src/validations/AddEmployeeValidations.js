import * as Yup from 'yup';

export const addEmployeeSchema = Yup.object({
    email: Yup.string().email().required(),
    password: Yup.string().required(),
    confirmPassword: Yup.string().oneOf([Yup.ref('password'), null], 'Passwords must match'),
});

