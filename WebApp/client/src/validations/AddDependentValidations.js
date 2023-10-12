import * as Yup from 'yup';

export const addDependentSchema = Yup.object({
    firstName: Yup.string().required(),
    lastName: Yup.string().required(),
    gender: Yup.string().required(),
    age: Yup.number().required(),
    relation: Yup.string().required()
});

