<?php
/**
 * XXProto_XXDMConnectVerifyReq
 *
 * @message XXProto.XXDMConnectVerifyReq
 *
 */
class XXProto_XXDMConnectVerifyReq extends ProtocolBuffersMessage
{
  protected $user_info;

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
 * XXProto_XXDMConnectVerifyRes
 *
 * @message XXProto.XXDMConnectVerifyRes
 *
 */
class XXProto_XXDMConnectVerifyRes extends ProtocolBuffersMessage
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
 * XXProto_XXDMConnectProto
 *
 * @message XXProto.XXDMConnectProto
 *
 */
class XXProto_XXDMConnectProto extends ProtocolBuffersMessage
{
  protected $result;

  protected $subcmd;

  protected $verify_req;

  protected $verify_res;


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
        "name"     => "verify_req",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXDMConnectVerifyReq",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "verify_res",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXDMConnectVerifyRes",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXDMConnectProtoErrorCode
 *
 * @enum XXProto.XXDMConnectProtoErrorCode
 */
class XXProto_XXDMConnectProtoErrorCode
{
  const XXDMConnect_Err_None = 0;
  const XXDMConnect_Err_Fail = 1999;
}

/**
 * XXProto_XXDMConnectProto_CMD
 *
 * @enum XXProto.XXDMConnectProto_CMD
 */
class XXProto_XXDMConnectProto_CMD
{
  const CMD_XXDMConnectProto = 1207;
}

/**
 * XXProto_XXSUBCMD_XXDMConnectProto
 *
 * @enum XXProto.XXSUBCMD_XXDMConnectProto
 */
class XXProto_XXSUBCMD_XXDMConnectProto
{
  const SUBCMD_XXDMConnectProto_CONNECTREQ = 1;
  const SUBCMD_XXDMConnectProto_CONNECTRES = 2;
  const SUBCMD_XXDMConnectProto_DISCONNECTREQ = 3;
  const SUBCMD_XXDMConnectProto_DISCONNECTRES = 4;
  const SUBCMD_XXDMConnectProto_HALFCONNECTREQ = 5;
  const SUBCMD_XXDMConnectProto_HALFCONNECTRES = 6;
}

