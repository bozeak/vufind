<?php

namespace Inlead;

use Inlead\Controller\AbstractBaseFactory;
use Laminas\Router\Http\Literal;
use Laminas\Router\Http\Method;
use Laminas\Router\Http\Segment;

return [
    'router' => [
        'routes' => [
            'inlead.manager' => [
                'type' => Literal::class,
                'options' => [
                    'route' => '/api/manager',
                    'defaults' => [
                        'controller' => Controller\ManagerAPIController::class,
                        'action' => 'getList'
                    ]
                ],
                'may_terminate' => true,
                'child_routes' => [
                    'details' => [
                        'type' => Segment::class,
                        'options' => [
                            'verb' => 'get',
                            'route' => '/:id',
                            'constraints' => [
                                'id' => '\d+',
                            ],
                        ],
                    ],
                ],
            ],
            'inlead.manager.create' => [
                'type' => Literal::class,
                'options' => [
                    'route' => '/api/manager/create',
                    'defaults' => [
                        'controller' => Controller\ManagerAPIController::class,
                        'action' => 'create'
                    ],
                ],
            ],
            'inlead.manager.update' => [
                'type' => Literal::class,
                'options' => [
                    'verb' => 'put',
                    'route' => '/api/manager/update',
                    'defaults' => [
                        'controller' => Controller\ManagerAPIController::class,
                        'action' => 'update'
                    ],
                ],
            ],
            'inlead.manager.destroy' => [
                'type' => Literal::class,
                'options' => [
                    'verb' => 'delete',
                    'route' => '/api/manager/destroy',
                    'defaults' => [
                        'controller' => Controller\ManagerAPIController::class,
                        'action' => 'destroy'
                    ],
                ],
            ],
        ],
    ],

    'controllers' => [
        'factories' => [
            Controller\ManagerAPIController::class => AbstractBaseFactory::class,
        ],
    ],
    'service_manager' => [
        'allow_override' => true,
        'factories' => [
            'Inlead\Db\Table\PluginManager' => 'VuFind\ServiceManager\AbstractPluginManagerFactory',
            'Inlead\Db\Row\PluginManager' => 'VuFind\ServiceManager\AbstractPluginManagerFactory',
        ],
        'alias' => [
            'Inlead\DbRowPluginManager' => 'Inlead\Db\Row\PluginManager',
            'Inlead\DbTablePluginManager' => 'Inlead\Db\Table\PluginManager',
        ],
    ],
    'inlead' => [
        'plugin_managers' => [
            'db_row' => [ /* see Inlead\Db\Row\PluginManager for defaults */],
            'db_table' => [ /* see Inlead\Db\Table\PluginManager for defaults */],
        ]
    ],
];
