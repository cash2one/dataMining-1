<?php
/**
 * XXProto_XXDMMessageReq
 *
 * @message XXProto.XXDMMessageReq
 *
 */
class XXProto_XXDMMessageReq extends ProtocolBuffersMessage
{
  protected $message_text;

  protected $user_nickname;

  protected $head_icon_url;

  protected $dm_level;

  protected $channel_id;

  protected $timestamp;

  protected $target_uin;


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
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "message_text",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "user_nickname",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "head_icon_url",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "dm_level",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_DMLevel::DMLevel_Normal,
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "channel_id",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "timestamp",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(7, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "target_uin",
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
 * XXProto_XXDMMessageRes
 *
 * @message XXProto.XXDMMessageRes
 *
 */
class XXProto_XXDMMessageRes extends ProtocolBuffersMessage
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
 * XXProto_XXDMMessageProto
 *
 * @message XXProto.XXDMMessageProto
 *
 */
class XXProto_XXDMMessageProto extends ProtocolBuffersMessage
{
  protected $result;

  protected $subcmd;

  protected $message_req;

  protected $message_res;


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
        "name"     => "message_req",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXDMMessageReq",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "message_res",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXDMMessageRes",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXDMMessageProtoErrorCode
 *
 * @enum XXProto.XXDMMessageProtoErrorCode
 */
class XXProto_XXDMMessageProtoErrorCode
{
  const XXDMMessage_Err_None = 0;
  const XXDMMessage_Err_Black = 1001;
  const XXDMMessage_Err_TooQuick = 1002;
  const XXDMMessage_Err_Fail = 1999;
}

/**
 * XXProto_XXDMMessageProto_CMD
 *
 * @enum XXProto.XXDMMessageProto_CMD
 */
class XXProto_XXDMMessageProto_CMD
{
  const CMD_XXDMMessageProto = 1208;
}

/**
 * XXProto_XXSUBCMD_XXDMMessageProto
 *
 * @enum XXProto.XXSUBCMD_XXDMMessageProto
 */
class XXProto_XXSUBCMD_XXDMMessageProto
{
  const SUBCMD_XXDMMessageProto_MESSAGEREQ = 1;
  const SUBCMD_XXDMMessageProto_MESSAGERES = 2;
}

