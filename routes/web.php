<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
 // routes for states.
Route::group(array('prefix' => 'states'), function() {
    Route::get('/', 'StateController@index');
    Route::get('/add-states', 'StateController@add');
    Route::post('/add-states-post', 'StateController@addPost');
    Route::get('/delete-states/{id}', 'StateController@delete');
    Route::get('/edit-states/{id}', 'StateController@edit');
    Route::post('/edit-states-post', 'StateController@editPost');
    Route::get('/change-status-states/{id}', 'StateController@changeStatus');
    Route::get('/view-states/{id}', 'StateController@view');
});
// end of states routes
// routes for sms_subscribers.
Route::group(array('prefix' => 'sms_subscribers'), function() {
    Route::get('/', 'SmsSubscriberController@index');
    Route::get('/add-sms_subscribers', 'SmsSubscriberController@add');
    Route::post('/add-sms_subscribers-post', 'SmsSubscriberController@addPost');
    Route::get('/delete-sms_subscribers/{id}', 'SmsSubscriberController@delete');
    Route::get('/edit-sms_subscribers/{id}', 'SmsSubscriberController@edit');
    Route::post('/edit-sms_subscribers-post', 'SmsSubscriberController@editPost');
    Route::get('/change-status-sms_subscribers/{id}', 'SmsSubscriberController@changeStatus');
    Route::get('/view-sms_subscribers/{id}', 'SmsSubscriberController@view');
    Route::get('/api', 'SmsSubscriberController@index2');
});
// end of sms_subscribers routes
// routes for sms_society_master.
Route::group(array('prefix' => 'sms_society_master'), function() {
    Route::get('/', 'SmsSocietyMasterController@index');
    Route::get('/add-sms_society_master', 'SmsSocietyMasterController@add');
    Route::post('/add-sms_society_master-post', 'SmsSocietyMasterController@addPost');
    Route::get('/delete-sms_society_master/{id}', 'SmsSocietyMasterController@delete');
    Route::get('/edit-sms_society_master/{id}', 'SmsSocietyMasterController@edit');
    Route::post('/edit-sms_society_master-post', 'SmsSocietyMasterController@editPost');
    Route::get('/change-status-sms_society_master/{id}', 'SmsSocietyMasterController@changeStatus');
    Route::get('/view-sms_society_master/{id}', 'SmsSocietyMasterController@view');
});
// end of sms_society_master routes
// routes for sms_areacode.
Route::group(array('prefix' => 'sms_areacode'), function() {
    Route::get('/', 'SmsAreacodeController@index');
    Route::get('/add-sms_areacode', 'SmsAreacodeController@add');
    Route::post('/add-sms_areacode-post', 'SmsAreacodeController@addPost');
    Route::get('/delete-sms_areacode/{id}', 'SmsAreacodeController@delete');
    Route::get('/edit-sms_areacode/{id}', 'SmsAreacodeController@edit');
    Route::post('/edit-sms_areacode-post', 'SmsAreacodeController@editPost');
    Route::get('/change-status-sms_areacode/{id}', 'SmsAreacodeController@changeStatus');
    Route::get('/view-sms_areacode/{id}', 'SmsAreacodeController@view');
});
// end of sms_areacode routes
// routes for sms_operator.
Route::group(array('prefix' => 'sms_operator'), function() {
    Route::get('/', 'SmsOperatorController@index');
    Route::get('/add-sms_operator', 'SmsOperatorController@add');
    Route::post('/add-sms_operator-post', 'SmsOperatorController@addPost');
    Route::get('/delete-sms_operator/{id}', 'SmsOperatorController@delete');
    Route::get('/edit-sms_operator/{id}', 'SmsOperatorController@edit');
    Route::post('/edit-sms_operator-post', 'SmsOperatorController@editPost');
    Route::get('/change-status-sms_operator/{id}', 'SmsOperatorController@changeStatus');
    Route::get('/view-sms_operator/{id}', 'SmsOperatorController@view');
});
// end of sms_operator routes
// routes for sms_subscriberaccounts.
Route::group(array('prefix' => 'sms_subscriberaccounts'), function() {
    Route::get('/', 'SmsSubscriberaccountController@index');
    Route::get('/add-sms_subscriberaccounts', 'SmsSubscriberaccountController@add');
    Route::post('/add-sms_subscriberaccounts-post', 'SmsSubscriberaccountController@addPost');
    Route::get('/delete-sms_subscriberaccounts/{id}', 'SmsSubscriberaccountController@delete');
    Route::get('/edit-sms_subscriberaccounts/{id}', 'SmsSubscriberaccountController@edit');
    Route::post('/edit-sms_subscriberaccounts-post', 'SmsSubscriberaccountController@editPost');
    Route::get('/change-status-sms_subscriberaccounts/{id}', 'SmsSubscriberaccountController@changeStatus');
    Route::get('/view-sms_subscriberaccounts/{id}', 'SmsSubscriberaccountController@view');
});
// end of sms_subscriberaccounts routes
// routes for sms_stbs.
Route::group(array('prefix' => 'sms_stbs'), function() {
    Route::get('/', 'SmsStbController@index');
    Route::get('/add-sms_stbs', 'SmsStbController@add');
    Route::post('/add-sms_stbs-post', 'SmsStbController@addPost');
    Route::get('/delete-sms_stbs/{id}', 'SmsStbController@delete');
    Route::get('/edit-sms_stbs/{id}', 'SmsStbController@edit');
    Route::post('/edit-sms_stbs-post', 'SmsStbController@editPost');
    Route::get('/change-status-sms_stbs/{id}', 'SmsStbController@changeStatus');
    Route::get('/view-sms_stbs/{id}', 'SmsStbController@view');
});
// end of sms_stbs routes
// routes for sms_stbscbrand.
Route::group(array('prefix' => 'sms_stbscbrand'), function() {
    Route::get('/', 'SmsStbscbrandController@index');
    Route::get('/add-sms_stbscbrand', 'SmsStbscbrandController@add');
    Route::post('/add-sms_stbscbrand-post', 'SmsStbscbrandController@addPost');
    Route::get('/delete-sms_stbscbrand/{id}', 'SmsStbscbrandController@delete');
    Route::get('/edit-sms_stbscbrand/{id}', 'SmsStbscbrandController@edit');
    Route::post('/edit-sms_stbscbrand-post', 'SmsStbscbrandController@editPost');
    Route::get('/change-status-sms_stbscbrand/{id}', 'SmsStbscbrandController@changeStatus');
    Route::get('/view-sms_stbscbrand/{id}', 'SmsStbscbrandController@view');
});
// end of sms_stbscbrand routes
// routes for sms_smartcards.
Route::group(array('prefix' => 'sms_smartcards'), function() {
    Route::get('/', 'SmsSmartcardController@index');
    Route::get('/add-sms_smartcards', 'SmsSmartcardController@add');
    Route::post('/add-sms_smartcards-post', 'SmsSmartcardController@addPost');
    Route::get('/delete-sms_smartcards/{id}', 'SmsSmartcardController@delete');
    Route::get('/edit-sms_smartcards/{id}', 'SmsSmartcardController@edit');
    Route::post('/edit-sms_smartcards-post', 'SmsSmartcardController@editPost');
    Route::get('/change-status-sms_smartcards/{id}', 'SmsSmartcardController@changeStatus');
    Route::get('/view-sms_smartcards/{id}', 'SmsSmartcardController@view');
});
// end of sms_smartcards routes
// routes for prp_accounttransaction.
Route::group(array('prefix' => 'prp_accounttransaction'), function() {
    Route::get('/', 'PrpAccounttransactionController@index');
    Route::get('/add-prp_accounttransaction', 'PrpAccounttransactionController@add');
    Route::post('/add-prp_accounttransaction-post', 'PrpAccounttransactionController@addPost');
    Route::get('/delete-prp_accounttransaction/{id}', 'PrpAccounttransactionController@delete');
    Route::get('/edit-prp_accounttransaction/{id}', 'PrpAccounttransactionController@edit');
    Route::post('/edit-prp_accounttransaction-post', 'PrpAccounttransactionController@editPost');
    Route::get('/change-status-prp_accounttransaction/{id}', 'PrpAccounttransactionController@changeStatus');
    Route::get('/view-prp_accounttransaction/{id}', 'PrpAccounttransactionController@view');
});
// end of prp_accounttransaction routes
// routes for sms_pairing.
Route::group(array('prefix' => 'sms_pairing'), function() {
    Route::get('/', 'SmsPairingController@index');
    Route::get('/add-sms_pairing', 'SmsPairingController@add');
    Route::post('/add-sms_pairing-post', 'SmsPairingController@addPost');
    Route::get('/delete-sms_pairing/{id}', 'SmsPairingController@delete');
    Route::get('/edit-sms_pairing/{id}', 'SmsPairingController@edit');
    Route::post('/edit-sms_pairing-post', 'SmsPairingController@editPost');
    Route::get('/change-status-sms_pairing/{id}', 'SmsPairingController@changeStatus');
    Route::get('/view-sms_pairing/{id}', 'SmsPairingController@view');
});
// end of sms_pairing routes
// routes for colors.
Route::group(array('prefix' => 'colors'), function() {
    Route::get('/', 'ColorController@index');
    Route::get('/add-colors', 'ColorController@add');
    Route::post('/add-colors-post', 'ColorController@addPost');
    Route::get('/delete-colors/{id}', 'ColorController@delete');
    Route::get('/edit-colors/{id}', 'ColorController@edit');
    Route::post('/edit-colors-post', 'ColorController@editPost');
    Route::get('/change-status-colors/{id}', 'ColorController@changeStatus');
    Route::get('/view-colors/{id}', 'ColorController@view');
});
// end of colors routes
// routes for states.
Route::group(array('prefix' => 'states'), function() {
    Route::get('/', 'StateController@index');
    Route::get('/add-states', 'StateController@add');
    Route::post('/add-states-post', 'StateController@addPost');
    Route::get('/delete-states/{id}', 'StateController@delete');
    Route::get('/edit-states/{id}', 'StateController@edit');
    Route::post('/edit-states-post', 'StateController@editPost');
    Route::get('/change-status-states/{id}', 'StateController@changeStatus');
    Route::get('/view-states/{id}', 'StateController@view');
});
// end of states routes
// routes for students.
Route::group(array('prefix' => 'students'), function() {
    Route::get('/', 'StudentController@index');
    Route::get('/add-students', 'StudentController@add');
    Route::post('/add-students-post', 'StudentController@addPost');
    Route::get('/delete-students/{id}', 'StudentController@delete');
    Route::get('/edit-students/{id}', 'StudentController@edit');
    Route::post('/edit-students-post', 'StudentController@editPost');
    Route::get('/change-status-students/{id}', 'StudentController@changeStatus');
    Route::get('/view-students/{id}', 'StudentController@view');
});
// end of students routes
// routes for prp_accounttransaction.
Route::group(array('prefix' => 'prp_accounttransaction'), function() {
    Route::get('/', 'PrpAccounttransactionController@index');
    Route::get('/add-prp_accounttransaction', 'PrpAccounttransactionController@add');
    Route::post('/add-prp_accounttransaction-post', 'PrpAccounttransactionController@addPost');
    Route::get('/delete-prp_accounttransaction/{id}', 'PrpAccounttransactionController@delete');
    Route::get('/edit-prp_accounttransaction/{id}', 'PrpAccounttransactionController@edit');
    Route::post('/edit-prp_accounttransaction-post', 'PrpAccounttransactionController@editPost');
    Route::get('/change-status-prp_accounttransaction/{id}', 'PrpAccounttransactionController@changeStatus');
    Route::get('/view-prp_accounttransaction/{id}', 'PrpAccounttransactionController@view');
});
// end of prp_accounttransaction routes
// routes for stbs.
Route::group(array('prefix' => 'stbs'), function() {
    Route::get('/', 'StbController@index');
    Route::get('/add-stbs', 'StbController@add');
    Route::post('/add-stbs-post', 'StbController@addPost');
    Route::get('/delete-stbs/{id}', 'StbController@delete');
    Route::get('/edit-stbs/{id}', 'StbController@edit');
    Route::post('/edit-stbs-post', 'StbController@editPost');
    Route::get('/change-status-stbs/{id}', 'StbController@changeStatus');
    Route::get('/view-stbs/{id}', 'StbController@view');
});
// end of stbs routes
// routes for users.
Route::group(array('prefix' => 'users'), function() {
    Route::get('/', 'UserController@index');
    Route::get('/add-users', 'UserController@add');
    Route::post('/add-users-post', 'UserController@addPost');
    Route::get('/delete-users/{id}', 'UserController@delete');
    Route::get('/edit-users/{id}', 'UserController@edit');
    Route::post('/edit-users-post', 'UserController@editPost');
    Route::get('/change-status-users/{id}', 'UserController@changeStatus');
    Route::get('/view-users/{id}', 'UserController@view');
});
// end of users routes
// routes for sms_subscribers_details.
Route::group(array('prefix' => 'sms_subscribers_details'), function() {
    Route::get('/', 'SmsSubscribersDetailController@index');
    Route::get('/add-sms_subscribers_details', 'SmsSubscribersDetailController@add');
    Route::post('/add-sms_subscribers_details-post', 'SmsSubscribersDetailController@addPost');
    Route::get('/delete-sms_subscribers_details/{id}', 'SmsSubscribersDetailController@delete');
    Route::get('/edit-sms_subscribers_details/{id}', 'SmsSubscribersDetailController@edit');
    Route::post('/edit-sms_subscribers_details-post', 'SmsSubscribersDetailController@editPost');
    Route::get('/change-status-sms_subscribers_details/{id}', 'SmsSubscribersDetailController@changeStatus');
    Route::get('/view-sms_subscribers_details/{id}', 'SmsSubscribersDetailController@view');
});
// end of sms_subscribers_details routes
// routes for sms_access.
Route::group(array('prefix' => 'sms_access'), function() {
    Route::get('/', 'SmsAccesController@index');
    Route::get('/add-sms_access', 'SmsAccesController@add');
    Route::post('/add-sms_access-post', 'SmsAccesController@addPost');
    Route::get('/delete-sms_access/{id}', 'SmsAccesController@delete');
    Route::get('/edit-sms_access/{id}', 'SmsAccesController@edit');
    Route::post('/edit-sms_access-post', 'SmsAccesController@editPost');
    Route::get('/change-status-sms_access/{id}', 'SmsAccesController@changeStatus');
    Route::get('/view-sms_access/{id}', 'SmsAccesController@view');
});
// end of sms_access routes
// routes for sms_society_master.
Route::group(array('prefix' => 'sms_society_master'), function() {
    Route::get('/', 'SmsSocietyMasterController@index');
    Route::get('/add-sms_society_master', 'SmsSocietyMasterController@add');
    Route::post('/add-sms_society_master-post', 'SmsSocietyMasterController@addPost');
    Route::get('/delete-sms_society_master/{id}', 'SmsSocietyMasterController@delete');
    Route::get('/edit-sms_society_master/{id}', 'SmsSocietyMasterController@edit');
    Route::post('/edit-sms_society_master-post', 'SmsSocietyMasterController@editPost');
    Route::get('/change-status-sms_society_master/{id}', 'SmsSocietyMasterController@changeStatus');
    Route::get('/view-sms_society_master/{id}', 'SmsSocietyMasterController@view');
});
// end of sms_society_master routes
// routes for sms_areacode.
Route::group(array('prefix' => 'sms_areacode'), function() {
    Route::get('/', 'SmsAreacodeController@index');
    Route::get('/add-sms_areacode', 'SmsAreacodeController@add');
    Route::post('/add-sms_areacode-post', 'SmsAreacodeController@addPost');
    Route::get('/delete-sms_areacode/{id}', 'SmsAreacodeController@delete');
    Route::get('/edit-sms_areacode/{id}', 'SmsAreacodeController@edit');
    Route::post('/edit-sms_areacode-post', 'SmsAreacodeController@editPost');
    Route::get('/change-status-sms_areacode/{id}', 'SmsAreacodeController@changeStatus');
    Route::get('/view-sms_areacode/{id}', 'SmsAreacodeController@view');
});
// end of sms_areacode routes
// routes for sms_stbscbrand.
Route::group(array('prefix' => 'sms_stbscbrand'), function() {
    Route::get('/', 'SmsStbscbrandController@index');
    Route::get('/add-sms_stbscbrand', 'SmsStbscbrandController@add');
    Route::post('/add-sms_stbscbrand-post', 'SmsStbscbrandController@addPost');
    Route::get('/delete-sms_stbscbrand/{id}', 'SmsStbscbrandController@delete');
    Route::get('/edit-sms_stbscbrand/{id}', 'SmsStbscbrandController@edit');
    Route::post('/edit-sms_stbscbrand-post', 'SmsStbscbrandController@editPost');
    Route::get('/change-status-sms_stbscbrand/{id}', 'SmsStbscbrandController@changeStatus');
    Route::get('/view-sms_stbscbrand/{id}', 'SmsStbscbrandController@view');
});
// end of sms_stbscbrand routes
// routes for prp_accounttransaction.
Route::group(array('prefix' => 'prp_accounttransaction'), function() {
    Route::get('/', 'PrpAccounttransactionController@index');
    Route::get('/add-prp_accounttransaction', 'PrpAccounttransactionController@add');
    Route::post('/add-prp_accounttransaction-post', 'PrpAccounttransactionController@addPost');
    Route::get('/delete-prp_accounttransaction/{id}', 'PrpAccounttransactionController@delete');
    Route::get('/edit-prp_accounttransaction/{id}', 'PrpAccounttransactionController@edit');
    Route::post('/edit-prp_accounttransaction-post', 'PrpAccounttransactionController@editPost');
    Route::get('/change-status-prp_accounttransaction/{id}', 'PrpAccounttransactionController@changeStatus');
    Route::get('/view-prp_accounttransaction/{id}', 'PrpAccounttransactionController@view');
});
// end of prp_accounttransaction routes
// routes for prp_bouque_assets.
Route::group(array('prefix' => 'prp_bouque_assets'), function() {
    Route::get('/', 'PrpBouqueAssetController@index');
    Route::get('/add-prp_bouque_assets', 'PrpBouqueAssetController@add');
    Route::post('/add-prp_bouque_assets-post', 'PrpBouqueAssetController@addPost');
    Route::get('/delete-prp_bouque_assets/{id}', 'PrpBouqueAssetController@delete');
    Route::get('/edit-prp_bouque_assets/{id}', 'PrpBouqueAssetController@edit');
    Route::post('/edit-prp_bouque_assets-post', 'PrpBouqueAssetController@editPost');
    Route::get('/change-status-prp_bouque_assets/{id}', 'PrpBouqueAssetController@changeStatus');
    Route::get('/view-prp_bouque_assets/{id}', 'PrpBouqueAssetController@view');
});
// end of prp_bouque_assets routes
// routes for sms_channel.
Route::group(array('prefix' => 'sms_channel'), function() {
    Route::get('/', 'SmsChannelController@index');
    Route::get('/add-sms_channel', 'SmsChannelController@add');
    Route::post('/add-sms_channel-post', 'SmsChannelController@addPost');
    Route::get('/delete-sms_channel/{id}', 'SmsChannelController@delete');
    Route::get('/edit-sms_channel/{id}', 'SmsChannelController@edit');
    Route::post('/edit-sms_channel-post', 'SmsChannelController@editPost');
    Route::get('/change-status-sms_channel/{id}', 'SmsChannelController@changeStatus');
    Route::get('/view-sms_channel/{id}', 'SmsChannelController@view');
});
// end of sms_channel routes
// routes for sms_package.
Route::group(array('prefix' => 'sms_package'), function() {
    Route::get('/', 'SmsPackageController@index');
    Route::get('/add-sms_package', 'SmsPackageController@add');
    Route::post('/add-sms_package-post', 'SmsPackageController@addPost');
    Route::get('/delete-sms_package/{id}', 'SmsPackageController@delete');
    Route::get('/edit-sms_package/{id}', 'SmsPackageController@edit');
    Route::post('/edit-sms_package-post', 'SmsPackageController@editPost');
    Route::get('/change-status-sms_package/{id}', 'SmsPackageController@changeStatus');
    Route::get('/view-sms_package/{id}', 'SmsPackageController@view');
});
// end of sms_package routes
// routes for sms_operator_assets.
Route::group(array('prefix' => 'sms_operator_assets'), function() {
    Route::get('/', 'SmsOperatorAssetController@index');
    Route::get('/add-sms_operator_assets', 'SmsOperatorAssetController@add');
    Route::post('/add-sms_operator_assets-post', 'SmsOperatorAssetController@addPost');
    Route::get('/delete-sms_operator_assets/{id}', 'SmsOperatorAssetController@delete');
    Route::get('/edit-sms_operator_assets/{id}', 'SmsOperatorAssetController@edit');
    Route::post('/edit-sms_operator_assets-post', 'SmsOperatorAssetController@editPost');
    Route::get('/change-status-sms_operator_assets/{id}', 'SmsOperatorAssetController@changeStatus');
    Route::get('/view-sms_operator_assets/{id}', 'SmsOperatorAssetController@view');
});
// end of sms_operator_assets routes
// routes for prp_demobouque.
Route::group(array('prefix' => 'prp_demobouque'), function() {
    Route::get('/', 'PrpDemobouqueController@index');
    Route::get('/add-prp_demobouque', 'PrpDemobouqueController@add');
    Route::post('/add-prp_demobouque-post', 'PrpDemobouqueController@addPost');
    Route::get('/delete-prp_demobouque/{id}', 'PrpDemobouqueController@delete');
    Route::get('/edit-prp_demobouque/{id}', 'PrpDemobouqueController@edit');
    Route::post('/edit-prp_demobouque-post', 'PrpDemobouqueController@editPost');
    Route::get('/change-status-prp_demobouque/{id}', 'PrpDemobouqueController@changeStatus');
    Route::get('/view-prp_demobouque/{id}', 'PrpDemobouqueController@view');
});
// end of prp_demobouque routes
// routes for prp_bouque.
Route::group(array('prefix' => 'prp_bouque'), function() {
    Route::get('/', 'PrpBouqueController@index');
    Route::post('/', 'PrpBouqueController@index');
	Route::get('/add-prp_bouque', 'PrpBouqueController@add');
    Route::post('/add-prp_bouque-post', 'PrpBouqueController@addPost');
    Route::get('/delete-prp_bouque/{id}', 'PrpBouqueController@delete');
    Route::get('/edit-prp_bouque/{id}', 'PrpBouqueController@edit');
    Route::post('/edit-prp_bouque-post', 'PrpBouqueController@editPost');
    Route::get('/change-status-prp_bouque/{id}', 'PrpBouqueController@changeStatus');
    Route::get('/view-prp_bouque/{id}', 'PrpBouqueController@view');
});
// end of prp_bouque routes
// routes for package_types.
Route::group(array('prefix' => 'package_types'), function() {
    Route::get('/', 'PackageTypeController@index');
    Route::get('/add-package_types', 'PackageTypeController@add');
    Route::post('/add-package_types-post', 'PackageTypeController@addPost');
    Route::get('/delete-package_types/{id}', 'PackageTypeController@delete');
    Route::get('/edit-package_types/{id}', 'PackageTypeController@edit');
    Route::post('/edit-package_types-post', 'PackageTypeController@editPost');
    Route::get('/change-status-package_types/{id}', 'PackageTypeController@changeStatus');
    Route::get('/view-package_types/{id}', 'PackageTypeController@view');
});
// end of package_types routes
// routes for sms_broadcaster.
Route::group(array('prefix' => 'sms_broadcaster'), function() {
    Route::get('/', 'SmsBroadcasterController@index');
    Route::get('/add-sms_broadcaster', 'SmsBroadcasterController@add');
    Route::post('/add-sms_broadcaster-post', 'SmsBroadcasterController@addPost');
    Route::get('/delete-sms_broadcaster/{id}', 'SmsBroadcasterController@delete');
    Route::get('/edit-sms_broadcaster/{id}', 'SmsBroadcasterController@edit');
    Route::post('/edit-sms_broadcaster-post', 'SmsBroadcasterController@editPost');
    Route::get('/change-status-sms_broadcaster/{id}', 'SmsBroadcasterController@changeStatus');
    Route::get('/view-sms_broadcaster/{id}', 'SmsBroadcasterController@view');
});
// end of sms_broadcaster routes