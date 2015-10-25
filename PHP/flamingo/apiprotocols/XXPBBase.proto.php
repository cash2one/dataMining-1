<?php
/**
 * XXProto_FileObject
 *
 * @message XXProto.FileObject
 *
 */
class XXProto_FileObject extends ProtocolBuffersMessage
{
  protected $ID;

  protected $url;

  protected $fileType;

  protected $size;

  protected $checksum;


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
        "name"     => "ID",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 1,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "url",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "fileType",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_FileType::FT_None,
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "size",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "checksum",
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
 * XXProto_userLocation
 *
 * @message XXProto.userLocation
 *
 */
class XXProto_userLocation extends ProtocolBuffersMessage
{
  protected $latitude;

  protected $longitude;


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
        "type"     => ProtocolBuffers::TYPE_DOUBLE,
        "name"     => "latitude",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_DOUBLE,
        "name"     => "longitude",
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
 * XXProto_UserInfo
 *
 * @message XXProto.UserInfo
 *
 */
class XXProto_UserInfo extends ProtocolBuffersMessage
{
  protected $uuid;

  protected $productID;

  protected $version;

  protected $buildNo;

  protected $channelID;

  protected $platformType;

  protected $subPlatform;

  protected $sysVersion;

  protected $imei;

  protected $macAddress;

  protected $imsi;

  protected $isRoot;

  protected $username;

  protected $simOparetor;

  protected $connectType;

  protected $location;


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
        "name"     => "uuid",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "productID",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_ProductID::PI_None,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "version",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "0.0",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "buildNo",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "0",
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "channelID",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "platformType",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_PlatformType::PT_None,
      )));
      $desc->addField(7, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "subPlatform",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_SubPlatform::SPT_None,
      )));
      $desc->addField(8, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "sysVersion",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(9, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "imei",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(10, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "macAddress",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(11, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "imsi",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(12, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_BOOL,
        "name"     => "isRoot",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => false,
      )));
      $desc->addField(13, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "username",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(14, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "simOparetor",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(15, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "connectType",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_ConnectType::EConnect_NoWeb,
      )));
      $desc->addField(16, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "location",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_userLocation",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_RequestBase
 *
 * @message XXProto.RequestBase
 *
 */
class XXProto_RequestBase extends ProtocolBuffersMessage
{
  protected $requestID;

  protected $serverID;

  protected $requestFunction;

  protected $requestType;


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
        "name"     => "requestID",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "serverID",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "requestFunction",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "requestType",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_RequestType::RT_None,
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_TimeControl
 *
 * @message XXProto.TimeControl
 *
 */
class XXProto_TimeControl extends ProtocolBuffersMessage
{
  protected $startTime;

  protected $endTime;

  protected $lastTime;


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
        "type"     => ProtocolBuffers::TYPE_INT64,
        "name"     => "startTime",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT64,
        "name"     => "endTime",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT64,
        "name"     => "lastTime",
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
 * XXProto_ServerAddress
 *
 * @message XXProto.ServerAddress
 *
 */
class XXProto_ServerAddress extends ProtocolBuffersMessage
{
  protected $server_ip;

  protected $server_port;


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
        "name"     => "server_ip",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "server_port",
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
 * XXProto_XXUnityCSPkgHead
 *
 * @message XXProto.XXUnityCSPkgHead
 *
 */
class XXProto_XXUnityCSPkgHead extends ProtocolBuffersMessage
{
  protected $cmd;

  protected $uin;

  protected $login_key;

  protected $requestType;

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
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "cmd",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT64,
        "name"     => "uin",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "login_key",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "requestType",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_RequestType::RT_None,
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "version",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
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
 * XXProto_XXUnityCSPkg
 *
 * @message XXProto.XXUnityCSPkg
 *
 */
class XXProto_XXUnityCSPkg extends ProtocolBuffersMessage
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
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXUnityCSPkgHead",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_BYTES,
        "name"     => "body",
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
 * XXProto_UserStateInfo
 *
 * @message XXProto.UserStateInfo
 *
 */
class XXProto_UserStateInfo extends ProtocolBuffersMessage
{
  protected $interface_ip;

  protected $interface_port;

  protected $client_ip;

  protected $client_port;

  protected $flow;

  protected $platform_type;

  protected $channel_info;

  protected $uin;

  protected $new_state;

  protected $connect_time;


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
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "channel_info",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXChannelInfo",
      )));
      $desc->addField(8, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT64,
        "name"     => "uin",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(9, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "new_state",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_XXDMLoginState::LOGIN_SUCCED,
      )));
      $desc->addField(10, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "connect_time",
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
 * XXProto_XXChannelInfo
 *
 * @message XXProto.XXChannelInfo
 *
 */
class XXProto_XXChannelInfo extends ProtocolBuffersMessage
{
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
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "channel_id",
        "required" => true,
        "optional" => false,
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
 * XXProto_XXUnitySSPkgHead
 *
 * @message XXProto.XXUnitySSPkgHead
 *
 */
class XXProto_XXUnitySSPkgHead extends ProtocolBuffersMessage
{
  protected $interface_ip;

  protected $interface_port;

  protected $client_ip;

  protected $client_port;

  protected $flow;

  protected $platform_type;

  protected $seq;

  protected $channel_info;

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
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "channel_info",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXChannelInfo",
      )));
      $desc->addField(9, new ProtocolBuffersFieldDescriptor(array(
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
 * XXProto_XXUnitySSPkg
 *
 * @message XXProto.XXUnitySSPkg
 *
 */
class XXProto_XXUnitySSPkg extends ProtocolBuffersMessage
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
        "message"  => "XXProto_XXUnityCSPkgHead",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "server_head",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXUnitySSPkgHead",
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
 * XXProto_PlatformType
 *
 * @enum XXProto.PlatformType
 */
class XXProto_PlatformType
{
  const PT_None = 0;
  const PT_iOS = 101;
  const PT_Android = 102;
}

/**
 * XXProto_SubPlatform
 *
 * @enum XXProto.SubPlatform
 */
class XXProto_SubPlatform
{
  const SPT_None = 0;
  const SPT_iPhone = 1001;
  const SPT_iPad = 1002;
  const SPT_iPod = 1003;
  const SPT_Android_General = 1004;
  const SPT_Android_Pad = 1005;
  const SPT_Android_HD = 1006;
}

/**
 * XXProto_FileType
 *
 * @enum XXProto.FileType
 */
class XXProto_FileType
{
  const FT_None = 0;
  const FT_IPA = 101;
  const FT_DEB = 102;
  const FT_APK = 103;
  const FT_ZIP = 104;
  const FT_PNG = 105;
  const FT_JPG = 106;
}

/**
 * XXProto_RequestType
 *
 * @enum XXProto.RequestType
 */
class XXProto_RequestType
{
  const RT_None = 0;
  const RT_User = 1;
  const RT_Auto = 2;
  const RT_Tips = 3;
}

/**
 * XXProto_ProductID
 *
 * @enum XXProto.ProductID
 */
class XXProto_ProductID
{
  const PI_None = 0;
  const PI_XXGameAssistant = 101;
  const PI_OOGameAssistant = 102;
}

/**
 * XXProto_UpdateControl
 *
 * @enum XXProto.UpdateControl
 */
class XXProto_UpdateControl
{
  const UPCTL_None = 0;
  const UPCTL_SlientUpdate = 101;
  const UPCTL_UserOpt = 102;
  const UPCTL_UserForce = 103;
}

/**
 * XXProto_ActivityControl
 *
 * @enum XXProto.ActivityControl
 */
class XXProto_ActivityControl
{
  const AC_None = 0;
  const AC_ToastTips = 101;
  const AC_AlertTips = 102;
  const AC_UserOpt = 103;
  const AC_UserForce = 104;
  const AC_NormalActivity = 105;
}

/**
 * XXProto_ConnectType
 *
 * @enum XXProto.ConnectType
 */
class XXProto_ConnectType
{
  const EConnect_NoWeb = 0;
  const EConnect_GPRS = 1;
  const EConnect_Wifi = 2;
}

/**
 * XXProto_DMLevel
 *
 * @enum XXProto.DMLevel
 */
class XXProto_DMLevel
{
  const DMLevel_Normal = 0;
  const DMLevel_Speaker = 1;
  const DMLevel_System = 2;
  const DMLevel_Black = 101;
}

/**
 * XXProto_XXUnityCSErrorCode
 *
 * @enum XXProto.XXUnityCSErrorCode
 */
class XXProto_XXUnityCSErrorCode
{
  const XXUnityCS_Err_None = 0;
  const XXUnityCS_Err_Auth_Fail = 1001;
  const XXUnityCS_Err_Not_Login = 1002;
  const XXUnityCS_Err_Unknown_User = 1003;
  const XXUnityCS_Err_Unknown_CMD = 1004;
  const XXUnityCS_Err_Unknown_Req = 1005;
  const XXUnityCS_Err_Unknown_Login_Req = 1006;
}

/**
 * XXProto_XXDMLoginState
 *
 * @enum XXProto.XXDMLoginState
 */
class XXProto_XXDMLoginState
{
  const LOGIN_SUCCED = 1;
  const HALF_LOGIN = 2;
  const LOGIN_OUT = 3;
}

