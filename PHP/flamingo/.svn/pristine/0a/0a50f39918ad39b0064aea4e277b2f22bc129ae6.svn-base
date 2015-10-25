<?php
/**
 * XXProto_SetStateReq
 *
 * @message XXProto.SetStateReq
 *
 */
class XXProto_SetStateReq extends ProtocolBuffersMessage
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
 * XXProto_SetStateRes
 *
 * @message XXProto.SetStateRes
 *
 */
class XXProto_SetStateRes extends ProtocolBuffersMessage
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
 * XXProto_SetHeartReq
 *
 * @message XXProto.SetHeartReq
 *
 */
class XXProto_SetHeartReq extends ProtocolBuffersMessage
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
 * XXProto_SetHeartRes
 *
 * @message XXProto.SetHeartRes
 *
 */
class XXProto_SetHeartRes extends ProtocolBuffersMessage
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
 * XXProto_UinState
 *
 * @message XXProto.UinState
 *
 */
class XXProto_UinState extends ProtocolBuffersMessage
{
  protected $uin;

  protected $interface_ip;

  protected $interface_port;

  protected $flow;

  protected $logic_state;


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
        "name"     => "interface_ip",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "interface_port",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT64,
        "name"     => "flow",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "logic_state",
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
 * XXProto_QueryStateReq
 *
 * @message XXProto.QueryStateReq
 *
 */
class XXProto_QueryStateReq extends ProtocolBuffersMessage
{
  protected $uin_list = array();


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
        "name"     => "uin_list",
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
 * XXProto_QueryStateRes
 *
 * @message XXProto.QueryStateRes
 *
 */
class XXProto_QueryStateRes extends ProtocolBuffersMessage
{
  protected $uinstate_list = array();


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
        "name"     => "uinstate_list",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_UinState",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXIMStateProto
 *
 * @message XXProto.XXIMStateProto
 *
 */
class XXProto_XXIMStateProto extends ProtocolBuffersMessage
{
  protected $result;

  protected $subcmd;

  protected $set_state_req;

  protected $set_state_res;

  protected $set_heartbeat_req;

  protected $set_heartbeat_res;

  protected $query_state_req;

  protected $query_state_res;


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
        "name"     => "set_state_req",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SetStateReq",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "set_state_res",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SetStateRes",
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "set_heartbeat_req",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SetHeartReq",
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "set_heartbeat_res",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_SetHeartRes",
      )));
      $desc->addField(7, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "query_state_req",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_QueryStateReq",
      )));
      $desc->addField(8, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "query_state_res",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_QueryStateRes",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXIMStateProto_Cmd
 *
 * @enum XXProto.XXIMStateProto_Cmd
 */
class XXProto_XXIMStateProto_Cmd
{
  const CMD_STATE = 4100;
}

/**
 * XXProto_XXIMStateProto_Subcmd
 *
 * @enum XXProto.XXIMStateProto_Subcmd
 */
class XXProto_XXIMStateProto_Subcmd
{
  const SUBCMD_STATE_ONLINEREQ = 1;
  const SUBCMD_STATE_ONLINERES = 2;
  const SUBCMD_STATE_OFFLINEREQ = 3;
  const SUBCMD_STATE_OFFLINERES = 4;
  const SUBCMD_STATE_HEARTBEATREQ = 5;
  const SUBCMD_STATE_HEARTBEATRES = 6;
  const SUBCMD_STATE_QUERYSTATEREQ = 7;
  const SUBCMD_STATE_QUERYSTATERES = 8;
}

/**
 * XXProto_ErrorCode
 *
 * @enum XXProto.ErrorCode
 */
class XXProto_ErrorCode
{
  const RETURN_OK = 0;
  const KEY_SERIALIZE_ERROR = 1;
  const VALUE_SERIALIZE_ERROR = 2;
  const REDIS_EXEC_ERROR = 3;
  const REDIS_SET_ERROR = 4;
  const REDIS_DEL_ERROR = 5;
  const REDIS_GET_ERROR = 6;
  const VALUE_PARSE_ERROR = 7;
  const REDIS_SVR_CANNOT_CONNECT = 8;
  const DATA_NOT_EXIST = 9;
}

