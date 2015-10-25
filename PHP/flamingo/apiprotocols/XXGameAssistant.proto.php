<?php
/**
 * XXProto_SoftwareBaseInfo
 *
 * @message XXProto.SoftwareBaseInfo
 *
 */
class XXProto_SoftwareBaseInfo extends ProtocolBuffersMessage
{
  protected $name;

  protected $version;

  protected $packageName;

  protected $packageFile;

  protected $updateTime;

  protected $supportMin;

  protected $supportSys;

  protected $language;


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
        "name"     => "name",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "version",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "packageName",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "packageFile",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_FileObject",
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT64,
        "name"     => "updateTime",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "supportMin",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(7, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "supportSys",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_PlatformType::PT_None,
      )));
      $desc->addField(8, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "language",
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
 * XXProto_SoftwareObject
 *
 * @message XXProto.SoftwareObject
 *
 */
class XXProto_SoftwareObject extends ProtocolBuffersMessage
{
  protected $UID;

  protected $softwareType;

  protected $sbInfo;

  protected $description;

  protected $updateDetails;

  protected $thumbnail;

  protected $pictures = array();

  protected $downloadCount;

  protected $suggestScore;

  protected $game_category;

  protected $has_ad;

  protected $need_net;

  protected $hack_game_details;

  protected $is_recommend;


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
        "name"     => "UID",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => -1,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "softwareType",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_SoftwareType::SWT_None,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "sbInfo",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SoftwareBaseInfo",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "description",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "updateDetails",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "thumbnail",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_FileObject",
      )));
      $desc->addField(7, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "pictures",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_FileObject",
      )));
      $desc->addField(8, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "downloadCount",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(9, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "suggestScore",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(10, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "game_category",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(11, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "has_ad",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(12, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "need_net",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(13, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "hack_game_details",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(14, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "is_recommend",
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
 * XXProto_RequestSoftwareList
 *
 * @message XXProto.RequestSoftwareList
 *
 */
class XXProto_RequestSoftwareList extends ProtocolBuffersMessage
{
  protected $requestBase;

  protected $userInfo;

  protected $softwareType;

  protected $headIndex;

  protected $count;

  protected $filterIDs = array();


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
        "name"     => "requestBase",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_RequestBase",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "userInfo",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_UserInfo",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "softwareType",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_SoftwareType::SWT_None,
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "headIndex",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "count",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 30,
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "filterIDs",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => true,
        "default"  => 0,
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_ResponseSoftwareList
 *
 * @message XXProto.ResponseSoftwareList
 *
 */
class XXProto_ResponseSoftwareList extends ProtocolBuffersMessage
{
  protected $result;

  protected $softwareObjects = array();

  protected $softwareType;

  protected $count;

  protected $tailIndex;


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
        "name"     => "softwareObjects",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SoftwareObject",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "softwareType",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_SoftwareType::SWT_None,
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "count",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "tailIndex",
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
 * XXProto_GameAssistMap
 *
 * @message XXProto.GameAssistMap
 *
 */
class XXProto_GameAssistMap extends ProtocolBuffersMessage
{
  protected $packageName;

  protected $assistType;

  protected $assistUID;


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
        "name"     => "packageName",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "assistType",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_SoftwareType::SWT_None,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "assistUID",
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
 * XXProto_RequestPackageState
 *
 * @message XXProto.RequestPackageState
 *
 */
class XXProto_RequestPackageState extends ProtocolBuffersMessage
{
  protected $requestBase;

  protected $userInfo;

  protected $appObjects = array();

  protected $assistObjects = array();


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
        "name"     => "requestBase",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_RequestBase",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "userInfo",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_UserInfo",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "appObjects",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SoftwareObject",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "assistObjects",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SoftwareObject",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_ResponsePackageState
 *
 * @message XXProto.ResponsePackageState
 *
 */
class XXProto_ResponsePackageState extends ProtocolBuffersMessage
{
  protected $result;

  protected $appObjects = array();

  protected $assistObjects = array();

  protected $gameAssistMaps = array();


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
        "name"     => "appObjects",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SoftwareObject",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "assistObjects",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SoftwareObject",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "gameAssistMaps",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_GameAssistMap",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_RequestUpdate
 *
 * @message XXProto.RequestUpdate
 *
 */
class XXProto_RequestUpdate extends ProtocolBuffersMessage
{
  protected $requestBase;

  protected $userInfo;


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
        "name"     => "requestBase",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_RequestBase",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "userInfo",
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
 * XXProto_ResponseUpdate
 *
 * @message XXProto.ResponseUpdate
 *
 */
class XXProto_ResponseUpdate extends ProtocolBuffersMessage
{
  protected $result;

  protected $updateControl;

  protected $version;

  protected $packageFile;

  protected $description;


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
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "updateControl",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_UpdateControl::UPCTL_None,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "version",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "packageFile",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_FileObject",
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "description",
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
 * XXProto_RequestFeedBack
 *
 * @message XXProto.RequestFeedBack
 *
 */
class XXProto_RequestFeedBack extends ProtocolBuffersMessage
{
  protected $requestBase;

  protected $userInfo;

  protected $details;


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
        "name"     => "requestBase",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_RequestBase",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "userInfo",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_UserInfo",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "details",
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
 * XXProto_RequestSearchAssist
 *
 * @message XXProto.RequestSearchAssist
 *
 */
class XXProto_RequestSearchAssist extends ProtocolBuffersMessage
{
  protected $requestBase;

  protected $userInfo;

  protected $assistIDs = array();


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
        "name"     => "requestBase",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_RequestBase",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "userInfo",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_UserInfo",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "assistIDs",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => true,
        "default"  => 0,
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_ResponseSearchAssist
 *
 * @message XXProto.ResponseSearchAssist
 *
 */
class XXProto_ResponseSearchAssist extends ProtocolBuffersMessage
{
  protected $result;

  protected $assistObjects = array();


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
        "name"     => "assistObjects",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SoftwareObject",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_RequestActivity
 *
 * @message XXProto.RequestActivity
 *
 */
class XXProto_RequestActivity extends ProtocolBuffersMessage
{
  protected $requestBase;

  protected $userInfo;


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
        "name"     => "requestBase",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_RequestBase",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "userInfo",
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
 * XXProto_ResponseActivity
 *
 * @message XXProto.ResponseActivity
 *
 */
class XXProto_ResponseActivity extends ProtocolBuffersMessage
{
  protected $result;

  protected $activityControl;

  protected $title;

  protected $url;

  protected $timeControl;


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
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "activityControl",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_ActivityControl::AC_None,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "title",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "url",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "timeControl",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_TimeControl",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXActivityInfo
 *
 * @message XXProto.XXActivityInfo
 *
 */
class XXProto_XXActivityInfo extends ProtocolBuffersMessage
{
  protected $id;

  protected $activityControl;

  protected $title;

  protected $url;

  protected $timeControl;


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
        "name"     => "id",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "activityControl",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_ActivityControl::AC_None,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "title",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "url",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "timeControl",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_TimeControl",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_RequestActivityV2
 *
 * @message XXProto.RequestActivityV2
 *
 */
class XXProto_RequestActivityV2 extends ProtocolBuffersMessage
{
  protected $requestBase;

  protected $userInfo;


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
        "name"     => "requestBase",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_RequestBase",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "userInfo",
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
 * XXProto_ResponseActivityV2
 *
 * @message XXProto.ResponseActivityV2
 *
 */
class XXProto_ResponseActivityV2 extends ProtocolBuffersMessage
{
  protected $result;

  protected $activity_list = array();


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
        "name"     => "activity_list",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXActivityInfo",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_SoftwareType
 *
 * @enum XXProto.SoftwareType
 */
class XXProto_SoftwareType
{
  const SWT_None = 0;
  const SWT_Game = 101;
  const SWT_Plugin = 102;
  const SWT_ModifiedGame = 103;
  const SWT_GameAssist = 104;
  const SWT_RecommendGame = 105;
  const SWT_NormalApp = 106;
}

