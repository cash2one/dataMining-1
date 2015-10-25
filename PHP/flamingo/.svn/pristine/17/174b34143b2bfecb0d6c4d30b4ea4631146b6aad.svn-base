<?php
/**
 * XXProto_XXAndroidLocalGamesData
 *
 * @message XXProto.XXAndroidLocalGamesData
 *
 */
class XXProto_XXAndroidLocalGamesData extends ProtocolBuffersMessage
{
  protected $UIDPackageName;

  protected $appName;

  protected $xxDataObject;

  protected $assistId;

  protected $assistVersion;

  protected $assistState;

  protected $hasComentUrl;

  protected $hasXXCircleUrl;

  protected $hasInstUrl;

  protected $hasAssistUpdate;

  protected $hasGameUpdate;


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
        "name"     => "UIDPackageName",
        "required" => true,
        "optional" => false,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(2, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "appName",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(3, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_MESSAGE,
        "name"     => "xxDataObject",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => null,
        "message"  => "XXProto_XXSoftDataV2",
      )));
      $desc->addField(4, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "assistId",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(5, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_STRING,
        "name"     => "assistVersion",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => "",
      )));
      $desc->addField(6, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_ENUM,
        "name"     => "assistState",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => XXProto_XXAndroidAssistState::XXAAS_None,
      )));
      $desc->addField(7, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "hasComentUrl",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(8, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "hasXXCircleUrl",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(9, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "hasInstUrl",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(10, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "hasAssistUpdate",
        "required" => false,
        "optional" => true,
        "repeated" => false,
        "packable" => false,
        "default"  => 0,
      )));
      $desc->addField(11, new ProtocolBuffersFieldDescriptor(array(
        "type"     => ProtocolBuffers::TYPE_INT32,
        "name"     => "hasGameUpdate",
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
 * XXProto_XXAndroidAssistState
 *
 * @enum XXProto.XXAndroidAssistState
 */
class XXProto_XXAndroidAssistState
{
  const XXAAS_None = 0;
  const XXAAS_AssistOpen = 1;
  const XXAAS_AssistClose = 2;
  const XXAAS_DownLoadAssist = 3;
  const XXAAS_NeedAssist = 4;
}

