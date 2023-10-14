import * as Yup from 'yup';

export const addDependentSchema = Yup.object().shape({
    firstName: Yup.string().required('* First name is required'),
    lastName: Yup.string().required('* Last name is required'),
    gender: Yup.string().notOneOf(['Choose...'], '* Please select a gender').required('* Gender is required'),
    age: Yup.number().required('* Age is required'),
    relation: Yup.string().required('* Relation is required')
});

