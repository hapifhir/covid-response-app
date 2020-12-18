import { FormlyFieldConfig } from '@ngx-formly/core';

export const questionnaireR4Form: FormlyFieldConfig[] = [
    {
        fieldGroupClassName: 'display-flex',
        fieldGroup: [
            {
                className: 'x   1',
                key: 'url',
                type: 'input',
                templateOptions: {
                    label: 'URL'
                }
            },
            {
                className: 'flex-1',
                key: 'version',
                type: 'input',
                templateOptions: {
                    label: 'Version'
                }
            }
        ]
    },
    {
        fieldGroupClassName: 'display-flex',
        fieldGroup: [
            {
                className: 'flex-1',
                key: 'name',
                type: 'input',
                templateOptions: {
                    label: 'Name'
                }
            },
            {
                className: 'flex-1',
                key: 'title',
                type: 'input',
                templateOptions: {
                    label: 'Title'
                }
            }
        ]
    },
    {
        fieldGroupClassName: 'display-flex',
        fieldGroup: [
            {
                className: 'flex-1',
                key: 'experimental',
                type: 'input',
                templateOptions: {
                    label: 'Experimental'
                }
            },
            {
                className: 'flex-1',
                key: 'publisher',
                type: 'input',
                templateOptions: {
                    label: 'Publisher'
                }
            }
        ]
    },
    {
        fieldGroupClassName: 'display-flex',
        fieldGroup: [
            {
                className: 'flex-1',
                key: 'description',
                type: 'input',
                templateOptions: {
                    label: 'Description'
                }
            },
            {
                className: 'flex-1',
                key: 'purpose',
                type: 'input',
                templateOptions: {
                    label: 'Purpose'
                }
            }
        ]
    },
    {
        fieldGroupClassName: 'display-flex',
        fieldGroup: [
            {
                className: 'flex-1',
                key: 'copyright',
                type: 'input',
                templateOptions: {
                    label: 'Copyright'
                }
            },
            {
                className: 'flex-1',
                key: 'approvalDate',
                type: 'datepicker',
                templateOptions: {
                    label: 'Approval Date'
                }
            }
        ]
    },
    {
        fieldGroupClassName: 'display-flex',
        fieldGroup: [
            {
                className: 'flex-1',
                key: 'lastReviewDate',
                type: 'datepicker',
                templateOptions: {
                    label: 'Last Review Date'
                }
            },
            // {
            //     className: 'flex-1',
            //     key: 'tester',
            //     type: 'date-time-picker',
            //     templateOptions: {
            //         required: true,
            //         label: 'Date example'
            //     }
            // }
        ]
    },
    {
        fieldGroupClassName: 'display-flex',
        fieldGroup: [
            {
                className: 'flex-1',
                key: 'status',
                type: 'select',
                templateOptions: {
                    label: 'Status',
                    options: [
                        { value: 'draft', label: 'Draft' },
                        { value: 'active', label: 'Active' },
                        { value: 'retired', label: 'Retired' },
                        { value: 'unknown', label: 'Unkown' },
                    ]
                }
            }
        ]
    },
    {
        key: 'item',
        type: 'array',
        templateOptions: {
            label: 'Item'
        },
        fieldArray: {
            fieldGroup: [
                {
                    key: 'linkId',
                    type: 'input',
                    templateOptions: {
                        label: 'LinkId'
                    }
                },
                {
                    key: 'definition',
                    type: 'input',
                    templateOptions: {
                        label: 'Definition'
                    }
                },
                {
                    key: 'prefix',
                    type: 'input',
                    templateOptions: {
                        label: 'prefix'
                    }
                },
                {
                    key: 'text',
                    type: 'input',
                    templateOptions: {
                        label: 'Text'
                    }
                },
                {
                    key: 'maxLength',
                    type: 'input',
                    templateOptions: {
                        type: 'number',
                        label: 'Max Length'
                    }
                },
                {
                    key: 'readOnly',
                    type: 'checkbox',
                    templateOptions: {
                        label: 'Read Only'
                    }
                }
            ]
        }
    },
    {
        key: 'derivedFrom',
        type: 'array',
        templateOptions: {
            label: 'derivedFrom'
        },
        fieldArray: {
            type: 'input'
        }
    },
    {
        key: 'subjectType',
        type: 'array',
        templateOptions: {
            label: 'subjectType'
        },
        fieldArray: {
            type: 'input'
        }
    },
    {
        key: 'contact',
        type: 'array',
        templateOptions: {
            label: 'contact'
        },
        fieldArray: {
            fieldGroup: [
                {
                    key: 'name',
                    type: 'input',
                    templateOptions: {
                        label: 'name'
                    }
                },
                {
                    key: 'telecom',
                    type: 'array',
                    templateOptions: {
                        label: 'telecom'
                    },
                    fieldArray: {
                        fieldGroup: [
                            {
                                key: 'system',
                                type: 'select',
                                templateOptions: {
                                    label: 'system',
                                    options: [
                                        { value: 'phone', label: 'Phone' },
                                        { value: 'fax', label: 'Fax' },
                                        { value: 'email', label: 'Email' },
                                        { value: 'pager', label: 'Pager' },
                                        { value: 'url', label: 'URL' },
                                        { value: 'sms', label: 'SMS' },
                                        { value: 'other', label: 'Other' }
                                    ]
                                }
                            },
                            {
                                key: 'value',
                                type: 'input',
                                templateOptions: {
                                    label: 'value'
                                }
                            },
                            {
                                key: 'use',
                                type: 'select',
                                templateOptions: {
                                    label: 'use',
                                    options: [
                                        { value: 'home', label: 'Home' },
                                        { value: 'work', label: 'Work' },
                                        { value: 'temp', label: 'Temp' },
                                        { value: 'old', label: 'Old' },
                                        { value: 'mobile', label: 'Mobile' }
                                    ]
                                }
                            },
                            {
                                key: 'rank',
                                type: 'input',
                                templateOptions: {
                                    label: 'rank'
                                }
                            },
                            {
                                key: 'period',
                                type: 'object',
                                templateOptions: {
                                    label: 'Period'
                                },
                                fieldGroup: [
                                    {
                                        key: 'start',
                                        type: 'datepicker',
                                        templateOptions: {
                                            label: 'start'
                                        }
                                    },
                                    {
                                        key: 'end',
                                        type: 'datepicker',
                                        templateOptions: {
                                            label: 'end'
                                        }
                                    },
                                ]
                            }
                        ]
                    }
                }
            ]
        }
    },
    {
        key: 'useContext',
        type: 'array',
        templateOptions: {
            label: 'useContext'
        },
        fieldArray: {
            fieldGroup: [
                {
                    key: 'code',
                    type: 'object',
                    templateOptions: {
                        label: 'code'
                    },
                    fieldGroup: [
                        {
                            key: 'system',
                            type: 'input',
                            templateOptions: {
                                label: 'system'
                            }
                        },
                        {
                            key: 'version',
                            type: 'input',
                            templateOptions: {
                                label: 'version'
                            }
                        },
                        {
                            key: 'code',
                            type: 'input',
                            templateOptions: {
                                label: 'code'
                            }
                        },
                        {
                            key: 'display',
                            type: 'input',
                            templateOptions: {
                                label: 'display'
                            }
                        },
                        {
                            key: 'userSelected',
                            type: 'checkbox',
                            templateOptions: {
                                label: 'userSelected'
                            }
                        }
                    ]
                },
                {
                    key: 'valueTypeSelected',
                    type: 'select',
                    templateOptions: {
                        label: 'value[x]',
                        options: [
                            { value: 'valueCodeableConcept', label: 'valueCodeableConcept' },
                            { value: 'valueQuantity', label: 'valueQuantity' },
                            { value: 'valueRange', label: 'valueRange' },
                            { value: 'valueReference', label: 'valueReference' },
                        ]
                    }
                }
            ]
        }
    },
    {
        key: 'jurisdiction',
        type: 'array',
        templateOptions: {
            label: 'jurisdiction'
        },
        fieldArray: {
            fieldGroup: [
                {
                    key: 'text',
                    type: 'input',
                    templateOptions: {
                        label: 'text'
                    }
                },
                {
                    key: 'coding',
                    type: 'array',
                    templateOptions: {
                        label: 'coding'
                    },
                    fieldArray: {
                        fieldGroup: [
                            {
                                key: 'system',
                                type: 'input',
                                templateOptions: {
                                    label: 'system'
                                }
                            },
                            {
                                key: 'version',
                                type: 'input',
                                templateOptions: {
                                    label: 'version'
                                }
                            },
                            {
                                key: 'code',
                                type: 'input',
                                templateOptions: {
                                    label: 'code'
                                }
                            },
                            {
                                key: 'display',
                                type: 'input',
                                templateOptions: {
                                    label: 'display'
                                }
                            },
                            {
                                key: 'userSelected',
                                type: 'checkbox',
                                templateOptions: {
                                    label: 'userSelected'
                                }
                            }
                        ]
                    }
                }
            ]
        }
    }
]