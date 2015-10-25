<?php
/**
 * XXProto_XXDanmakuAPIChannelInfoReq
 *
 * @message XXProto.XXDanmakuAPIChannelInfoReq
 *
 */
class XXProto_XXDanmakuAPIChannelInfoReq extends ProtocolBuffersMessage
{
  protected $user_info;

  protected $pkg_name;

  protected $app_name;


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
        "name"     => "pkg_name",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "app_name",
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
 * XXProto_XXDanmakuAPIChannelInfoRes
 *
 * @message XXProto.XXDanmakuAPIChannelInfoRes
 *
 */
class XXProto_XXDanmakuAPIChannelInfoRes extends ProtocolBuffersMessage
{
  protected $channel_id;

  protected $channel_name;

  protected $sub_channel_name;

  protected $server_address = array();


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
        "name"     => "channel_id",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "channel_name",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "sub_channel_name",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "server_address",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_ServerAddress",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXDanmakuAPIProto
 *
 * @message XXProto.XXDanmakuAPIProto
 *
 */
class XXProto_XXDanmakuAPIProto extends ProtocolBuffersMessage
{
  protected $result;

  protected $subcmd;

  protected $channel_info_req;

  protected $channel_info_res;


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
        "name"     => "channel_info_req",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXDanmakuAPIChannelInfoReq",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "channel_info_res",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXDanmakuAPIChannelInfoRes",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXSUBCMD_XXDanmakuAPIProto
 *
 * @enum XXProto.XXSUBCMD_XXDanmakuAPIProto
 */
class XXProto_XXSUBCMD_XXDanmakuAPIProto
{
  const SUBCMD_DANMAKUAPI_CHANNELINFOREQ = 1;
  const SUBCMD_DANMAKUAPI_CHANNELINFORES = 2;
}

/**
 * XXProto_XXDanmakuAPIProtoErrorCode
 *
 * @enum XXProto.XXDanmakuAPIProtoErrorCode
 */
class XXProto_XXDanmakuAPIProtoErrorCode
{
  const XXDanmakuAPI_Err_None = 0;
  const XXDanmakuAPI_Err_Other = 1999;
}

