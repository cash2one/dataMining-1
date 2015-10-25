<?php
/**
 * XXProto_XXIMClientPkgHead
 *
 * @message XXProto.XXIMClientPkgHead
 *
 */
class XXProto_XXIMClientPkgHead extends ProtocolBuffersMessage
{
  protected $uin;

  protected $cmd;

  protected $version;

  protected $seq_num;


  /**
   * get descriptor for protocol buffers
   * 
   * @return array
   */
  public static function getDescriptor()
  {
    static $descriptor;

    if (!isset($descriptor)) {
      $desc = new ProtocolBuffersDescriptorBuilder();
      $desc->addField(1, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT64,
        "name"     => "uin",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "cmd",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "version",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "seq_num",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXIMClientPkg
 *
 * @message XXProto.XXIMClientPkg
 *
 */
class XXProto_XXIMClientPkg extends ProtocolBuffersMessage
{
  protected $result;

  protected $head;

  protected $body;


  /**
   * get descriptor for protocol buffers
   * 
   * @return array
   */
  public static function getDescriptor()
  {
    static $descriptor;

    if (!isset($descriptor)) {
      $desc = new ProtocolBuffersDescriptorBuilder();
      $desc->addField(1, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "result",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "head",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXIMClientPkgHead",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_BYTES,
        "name"     => "body",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXIMServerPkgHead
 *
 * @message XXProto.XXIMServerPkgHead
 *
 */
class XXProto_XXIMServerPkgHead extends ProtocolBuffersMessage
{
  protected $interface_ip;

  protected $interface_port;

  protected $client_ip;

  protected $client_port;

  protected $flow;

  protected $platform_type;

  protected $seq;

  protected $reserverd;


  /**
   * get descriptor for protocol buffers
   * 
   * @return array
   */
  public static function getDescriptor()
  {
    static $descriptor;

    if (!isset($descriptor)) {
      $desc = new ProtocolBuffersDescriptorBuilder();
      $desc->addField(1, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "interface_ip",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "interface_port",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "client_ip",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "client_port",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT64,
        "name"     => "flow",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "platform_type",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_PlatformType::PT_None,
      )));
      $desc->addField(7, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "seq",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(8, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_BYTES,
        "name"     => "reserverd",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXIMServerPkg
 *
 * @message XXProto.XXIMServerPkg
 *
 */
class XXProto_XXIMServerPkg extends ProtocolBuffersMessage
{
  protected $client_head;

  protected $server_head;

  protected $body;


  /**
   * get descriptor for protocol buffers
   * 
   * @return array
   */
  public static function getDescriptor()
  {
    static $descriptor;

    if (!isset($descriptor)) {
      $desc = new ProtocolBuffersDescriptorBuilder();
      $desc->addField(1, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "client_head",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXIMClientPkgHead",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "server_head",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXIMServerPkgHead",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_BYTES,
        "name"     => "body",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_VerifyLoginReq
 *
 * @message XXProto.VerifyLoginReq
 *
 */
class XXProto_VerifyLoginReq extends ProtocolBuffersMessage
{
  protected $user_info;

  protected $key;

  protected $channel_id;


  /**
   * get descriptor for protocol buffers
   * 
   * @return array
   */
  public static function getDescriptor()
  {
    static $descriptor;

    if (!isset($descriptor)) {
      $desc = new ProtocolBuffersDescriptorBuilder();
      $desc->addField(1, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "user_info",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_UserInfo",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "key",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "channel_id",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_VerifyLoginRes
 *
 * @message XXProto.VerifyLoginRes
 *
 */
class XXProto_VerifyLoginRes extends ProtocolBuffersMessage
{

  /**
   * get descriptor for protocol buffers
   * 
   * @return array
   */
  public static function getDescriptor()
  {
    static $descriptor;

    if (!isset($descriptor)) {
      $desc = new ProtocolBuffersDescriptorBuilder();
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXIMLoginProto
 *
 * @message XXProto.XXIMLoginProto
 *
 */
class XXProto_XXIMLoginProto extends ProtocolBuffersMessage
{
  protected $result;

  protected $subcmd;

  protected $verify_login_req;

  protected $verify_login_res;


  /**
   * get descriptor for protocol buffers
   * 
   * @return array
   */
  public static function getDescriptor()
  {
    static $descriptor;

    if (!isset($descriptor)) {
      $desc = new ProtocolBuffersDescriptorBuilder();
      $desc->addField(1, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "result",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "subcmd",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "verify_login_req",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_VerifyLoginReq",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "verify_login_res",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_VerifyLoginRes",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXIMInterSvrErrorCode
 *
 * @enum XXProto.XXIMInterSvrErrorCode
 */
class XXProto_XXIMInterSvrErrorCode
{
  const IERR_OK = 0;
  const IERR_AUTH_ERROR = 1;
  const IERR_SET_STATE_ERROR = 2;
  const IERR_NOT_LOG_IN = 3;
  const IERR_UNKNOWN_USER = 4;
  const IERR_UNKNOWN_CMD = 5;
  const IERR_UNKNOWN_REQ = 6;
  const IERR_UNKNOWN_LOGIN_REQ = 7;
}

/**
 * XXProto_XXIMLoginProto_Cmd
 *
 * @enum XXProto.XXIMLoginProto_Cmd
 */
class XXProto_XXIMLoginProto_Cmd
{
  const CMD_LOGINCONNECT = 4097;
}

/**
 * XXProto_XXIMLoginProto_Subcmd
 *
 * @enum XXProto.XXIMLoginProto_Subcmd
 */
class XXProto_XXIMLoginProto_Subcmd
{
  const SUBCMD_LOGINCONNECT_LOGINREQ = 1;
  const SUBCMD_LOGINCONNECT_LOGINRES = 2;
  const SUBCMD_LOGINCONNECT_LOGOUTREQ = 3;
  const SUBCMD_LOGINCONNECT_LOGOUTRES = 4;
}

