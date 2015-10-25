<?php
/**
 * XXProto_XXDMAuthReq
 *
 * @message XXProto.XXDMAuthReq
 *
 */
class XXProto_XXDMAuthReq extends ProtocolBuffersMessage
{
  protected $user_info;


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
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXDMAuthRes
 *
 * @message XXProto.XXDMAuthRes
 *
 */
class XXProto_XXDMAuthRes extends ProtocolBuffersMessage
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
 * XXProto_XXDMAuthProto
 *
 * @message XXProto.XXDMAuthProto
 *
 */
class XXProto_XXDMAuthProto extends ProtocolBuffersMessage
{
  protected $result;

  protected $subcmd;

  protected $auth_req;

  protected $auth_res;


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
        "name"     => "auth_req",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXDMAuthReq",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "auth_res",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXDMAuthRes",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXDMAuthProtoErrorCode
 *
 * @enum XXProto.XXDMAuthProtoErrorCode
 */
class XXProto_XXDMAuthProtoErrorCode
{
  const XXDMAuth_Err_None = 0;
  const XXDMAuth_Err_Fail = 1999;
}

/**
 * XXProto_XXDMAuthProto_CMD
 *
 * @enum XXProto.XXDMAuthProto_CMD
 */
class XXProto_XXDMAuthProto_CMD
{
  const CMD_XXDMAuthProto = 1209;
}

/**
 * XXProto_XXSUBCMD_XXDMAuthProto
 *
 * @enum XXProto.XXSUBCMD_XXDMAuthProto
 */
class XXProto_XXSUBCMD_XXDMAuthProto
{
  const SUBCMD_XXDMAuthProto_AUTHREQ = 1;
  const SUBCMD_XXDMAuthProto_AUTHRES = 2;
}

