<?php
include_once "../apiutils/XXServerBase.php";
include_once "../apiutils/XXTEA.php";
include_once "../apiprotocols/XXPBBase.proto.php";
include_once "../apiprotocols/XXMGUserAccountV2.proto.php";

   $subcmd = XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_REGISTERREQ;//注册请求
// $subcmd = XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_UNITYLOGINREQ;// 统一登陆登出请求，
// $subcmd = XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETEMAILREQ;//邮箱设置请求
// $subcmd = XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_MYACCOUNTINFOREQ;//获取信息
// $subcmd = XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_VERFITYRESETPWDREQ;//获取信息SUBCMD_ACCOUNT_SETHEADREQ
// $subcmd = XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETHEADREQ;//获取信息

class TestXXMGUserAccount{
        //server name 
        const SERVER = "http://www.xmodgames.com/user/api/XXMGUserAccountV2.php";
        const CMD = 1604;
        const IUIN = 556706;
        const STRLOGINKEY = "llllll";
        const KEY = "#%$*)&*M<><vance";
		const FID = 4;
		const TID = 45;
		const SB_UIN = 111;
		const UUID = 10210;
		const PRODUCTID = 101;
		const VERSION = 1.0;

        protected $reqXXMGAccountProto;
        protected $resXXMGAccountProto;

        function __construct(){

        }



        function request_init(){
                $this->request = $this->reqXXUnityCSPkg->serializeToString();
                echo  $this->request."\n";
                $this->request = xxtea_encrypt($this->request, TestXXMGUserAccount::KEY);
                $this->request = base64_encode($this->request);
        //      echo $this->request."\n";
        }

        function response_init(){
                echo $this->response."\n";
                $this->response = base64_decode($this->response);
                $this->response = xxtea_decrypt($this->response, TestXXMGUserAccount::KEY);
        }

        private function reqXXMGAccountProto_init($subcmd){
                $this->reqXXMGAccountProto = new XXProto_XXMGAccountProto();
                $this->reqXXMGAccountProto->setResult(0);
                $this->reqXXMGAccountProto->setSubcmd($subcmd);

                switch($subcmd){
                        case XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_REGISTERREQ://注册请求，
                            $XXMGAccountregisterreReq = new XXProto_XXMGAccountRegisterReq();
                           /*  $UserInfo = new XXProto_UserInfo();
			                $UserInfo->setUuid('10210');
			                $UserInfo->setProductID(101);
			                $UserInfo->setVersion(1.0); */
			                
			                
			                //$XXMGAccountregisterreReq -> setUser_info($UserInfo);
                            $XXMGAccountregisterreReq -> setNick_name('aaamn5aaa');
                            $XXMGAccountregisterreReq -> setEmail('amaaaaaa@126.com');
                            $XXMGAccountregisterreReq -> setPwd('123456');

                            $this->reqXXMGAccountProto->setRegister_req($XXMGAccountregisterreReq);
                            break;
                            

                        case XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_VERFITYRESETPWDREQ:
                           	$XXMGVerfityresetpwdreq = new XXProto_XXMGVerfityResetPwdReq();
                           	$UserInfo = new XXProto_UserInfo();
                            $UserInfo->setUuid('10210');
                            $UserInfo->setProductID(101);
                            $UserInfo->setVersion(1.0);
                            
//                             required UserInfo userInfo = 1;     //客户端信息
//                             required string username = 2; //账号
//                             required string email = 3; //邮箱                            
                            
                            $XXMGVerfityresetpwdreq->setUsername('admin');
                           	$XXMGVerfityresetpwdreq->setEmail('970593688@126.com');
                            		
                            $XXMGVerfityresetpwdreq->setUserInfo($UserInfo);
                           	$this->reqXXMGAccountProto->setVerfity_set_pwd_req($XXMGVerfityresetpwdreq);
                           	break;
                            
                        case XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_UNITYLOGINREQ://统一登陆登出请求
                            $XXMGUnityLoginReq = new XXProto_XXMGUnityLoginReq();
                            
                            $UserInfo = new XXProto_UserInfo();
                            $UserInfo->setUuid('10210');
                            $UserInfo->setProductID(104);
                            $UserInfo->setVersion(1.0);

                            $XXMGUnityLoginReq -> setUserInfo($UserInfo);
                            
                            $XXMGUnityLoginReq -> setRequest_function(102);
                            
                            $XXMGUnityLoginReq -> setUserName('1534161306827280');
//                             $XXMGUnityLoginReq -> setPasswd('199135');
                            $this->reqXXMGAccountProto->setUnity_login_req($XXMGUnityLoginReq);
			                break;
			            case XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETEMAILREQ:
			                $XXMyAccountInfoReq = new XXProto_XXMyAccountInfoReq();
			                $UserInfo = new XXProto_UserInfo();
			                $UserInfo->setUuid('10210');
			                $UserInfo->setProductID(101);
			                $UserInfo->setVersion(1.0);
			                $XXMyAccountInfoReq->setUser_info($UserInfo);
			                $this->reqXXMGAccountProto->setMy_account_info_req($XXMyAccountInfoReq);
			                break;
						case XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_MYACCOUNTINFOREQ:
							$XXMyAccountInfoReq = new XXProto_XXMGMyAccountInfoReq();
							$UserInfo = new XXProto_UserInfo();
							$UserInfo->setUuid('10210');
							$UserInfo->setProductID(101);
							$UserInfo->setVersion(1.0);
							$XXMyAccountInfoReq->setUser_info($UserInfo);
							$this->reqXXMGAccountProto->setMy_account_info_req($XXMyAccountInfoReq);
							break;							

						case XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETHEADREQ:
							$XXMGAccountSetHeadReq = new XXProto_XXMGAccountSetHeadReq();
							$UserInfo = new XXProto_UserInfo();
							$UserInfo->setUuid('10210');
							$UserInfo->setProductID(101);
							$UserInfo->setVersion(1.0);
							$FileObject = new XXProto_FileObject();
								
							$FileObject -> setID(1);
							$XXMGAccountSetHeadReq->setUser_info($UserInfo);
							$XXMGAccountSetHeadReq->setFile_object($FileObject);
							$this->reqXXMGAccountProto->setMy_account_info_req($XXMGAccountSetHeadReq);
							break;
							
							
        		}
        }

        function reqXXUnityCSPkg_init($subcmd){

                $this->reqXXUnityCSPkg = new XXProto_XXUnityCSPkg();
                $head = new XXProto_XXUnityCSPkgHead();
                $UserInfo = new XXProto_UserInfo();
                $UserInfo->setUuid('10210');
                $UserInfo->setProductID(101);
                $UserInfo->setVersion(1.0);
                
                $head->setUser_info($UserInfo);
                $head->setCmd(TestXXMGUserAccount::CMD);
                $head->setUin(TestXXMGUserAccount::IUIN);
                $head->setLogin_key(TestXXMGUserAccount::STRLOGINKEY);
                $this->reqXXUnityCSPkg->setResult(0);//正常 默认
                $this->reqXXUnityCSPkg->setHead($head);

                //make body
                $this->reqXXMGAccountProto_init($subcmd);

                $this->reqXXUnityCSPkg->setBody($this->reqXXMGAccountProto->serializeToString());

        }

        function makeCurl(){
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, TestXXMGUserAccount::SERVER);
                curl_setopt($ch, CURLOPT_HEADER, 0);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $this->request);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //设定返回的结果以文件流返回
                curl_exec($ch);
                $this->response = curl_multi_getcontent($ch);//获取返回的结果
                echo "---------------".$this->response."\n";
                curl_close($ch);

        }

        function response_decode(){
                $this->response_init();
                $this->resXXUnityCSPkg = XXProto_XXUnityCSPkg::parseFromString($this->response);
                $resbody = $this->resXXUnityCSPkg->getBody();
                $this->resXXMGAccountProto = XXProto_XXMGAccountProto::parseFromString($resbody);
        }

        function prtResult(){

                echo "---------------Request---------------------\n";
                echo "result:".$this->reqXXUnityCSPkg->getResult()."\n";
                echo "cmd:".$this->reqXXUnityCSPkg->getHead()->getCmd()."\n";
                echo "subcmd:".$this->reqXXMGAccountProto->getSubcmd()."\n";

                echo "---------------Response---------------------\n";
                echo "cs_result:".$this->resXXUnityCSPkg->getResult()."\n";
                echo "cmd:".$this->resXXUnityCSPkg->getHead()->getCmd()."\n";
                echo "subcmd:".$this->resXXMGAccountProto->getSubcmd()."\n";
                echo "proto_result:".$this->resXXMGAccountProto->getResult()."\n";
                print_r($this->resXXMGAccountProto);

        }

        function runAutoTest(){
                for($i=1;$i<5;$i+=2){
                        $this->runTest($i);
                }

        }

        function runTest($subcmd = XXProto_XXSUBCMD_XXMGAccountRegisterProto::SUBCMD_ACCOUNT_SETSIGNATUREREQ){
                echo "--------------------------------------------------\n";
                $this->reqXXUnityCSPkg_init($subcmd);
                echo "------------------------reqXXUnityCSPkg_init--------------------------\n";
                $this->request_init();
                echo "------------------------request_init--------------------------\n";
                $this->makeCurl();
                echo "------------------------makeCurl--------------------------\n";
                $this->response_decode();
                echo "------------------------response_decode--------------------------\n";
                $this->prtResult();
        }
}

$test = new TestXXMGUserAccount;
$test->runTest($subcmd);//信息流
#$test->runAutoTest();

?>
                        
