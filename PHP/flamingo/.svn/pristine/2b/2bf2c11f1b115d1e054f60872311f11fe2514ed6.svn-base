<?php
/**
 * XXProto_XXCommentProto
 *
 * @message XXProto.XXCommentProto
 *
 */
class XXProto_XXCommentProto extends ProtocolBuffersMessage
{
  protected $result;

  protected $subcmd;

  protected $comment_list_req;

  protected $comment_list_res;

  protected $comment_edit_req;

  protected $comment_edit_res;


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
        "name"     => "comment_list_req",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXCommentListReq",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "comment_list_res",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXCommentListRes",
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "comment_edit_req",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXCommentEditReq",
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "comment_edit_res",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXCommentEditRes",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXCommentInfo
 *
 * @message XXProto.XXCommentInfo
 *
 */
class XXProto_XXCommentInfo extends ProtocolBuffersMessage
{
  protected $gameID;

  protected $cid;

  protected $content;

  protected $create_time;

  protected $role_info;

  protected $fromDevice;


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
        "name"     => "gameID",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => -1,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "cid",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "content",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "create_time",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "role_info",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_UserRoleInfo",
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "fromDevice",
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
 * XXProto_XXCommentListReq
 *
 * @message XXProto.XXCommentListReq
 *
 */
class XXProto_XXCommentListReq extends ProtocolBuffersMessage
{
  protected $gameID;

  protected $begin_cid;

  protected $count;

  protected $direction;


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
        "name"     => "gameID",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => -1,
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "begin_cid",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "count",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_UINT32,
        "name"     => "direction",
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
 * XXProto_XXCommentListRes
 *
 * @message XXProto.XXCommentListRes
 *
 */
class XXProto_XXCommentListRes extends ProtocolBuffersMessage
{
  protected $comment_info_list = array();


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
        "name"     => "comment_info_list",
        "required" => false,
        "optional" => false,
        "repeated" => true,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXCommentInfo",
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXCommentEditReq
 *
 * @message XXProto.XXCommentEditReq
 *
 */
class XXProto_XXCommentEditReq extends ProtocolBuffersMessage
{
  protected $comment_info;

  protected $edit_type;


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
        "name"     => "comment_info",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXCommentInfo",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "edit_type",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_XXCommentEditType::XXCommentEditType_None,
      )));
      $descriptor = $desc->build();
    }

    return $descriptor;
  }

}

/**
 * XXProto_XXCommentEditRes
 *
 * @message XXProto.XXCommentEditRes
 *
 */
class XXProto_XXCommentEditRes extends ProtocolBuffersMessage
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
 * XXProto_XXCommentProto_CMD
 *
 * @enum XXProto.XXCommentProto_CMD
 */
class XXProto_XXCommentProto_CMD
{
  const CMD_XXCommentProto = 1701;
}

/**
 * XXProto_XXSUBCMD_XXCommentProto
 *
 * @enum XXProto.XXSUBCMD_XXCommentProto
 */
class XXProto_XXSUBCMD_XXCommentProto
{
  const SUBCMD_XXCommentProto_COMMENTSLISTREQ = 1;
  const SUBCMD_XXCommentProto_COMMENTSLISTRES = 2;
  const SUBCMD_XXCommentProto_COMMENTEDITREQ = 3;
  const SUBCMD_XXCommentProto_COMMENTEDITRES = 4;
}

/**
 * XXProto_XXCommentEditType
 *
 * @enum XXProto.XXCommentEditType
 */
class XXProto_XXCommentEditType
{
  const XXCommentEditType_None = 0;
  const XXCommentEditType_New = 1;
  const XXCommentEditType_Remove = 2;
}

