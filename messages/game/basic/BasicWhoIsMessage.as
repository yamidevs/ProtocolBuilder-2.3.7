package com.ankamagames.dofus.network.messages.game.basic
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class BasicWhoIsMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 180;
       
      
      private var _isInitialized:Boolean = false;
      
      public var self:Boolean = false;
      
      public var position:int = 0;
      
      public var accountNickname:String = "";
      
      public var characterName:String = "";
      
      public var areaId:int = 0;
      
      public function BasicWhoIsMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 180;
      }
      
      public function initBasicWhoIsMessage(param1:Boolean = false, param2:int = 0, param3:String = "", param4:String = "", param5:int = 0) : BasicWhoIsMessage
      {
         this.self = param1;
         this.position = param2;
         this.accountNickname = param3;
         this.characterName = param4;
         this.areaId = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.self = false;
         this.position = 0;
         this.accountNickname = "";
         this.characterName = "";
         this.areaId = 0;
         this._isInitialized = false;
      }
      
      override public function pack(param1:IDataOutput) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(_loc2_);
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:IDataInput, param2:uint) : void
      {
         this.deserialize(param1);
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_BasicWhoIsMessage(param1);
      }
      
      public function serializeAs_BasicWhoIsMessage(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.self);
         param1.writeByte(this.position);
         param1.writeUTF(this.accountNickname);
         param1.writeUTF(this.characterName);
         param1.writeShort(this.areaId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_BasicWhoIsMessage(param1);
      }
      
      public function deserializeAs_BasicWhoIsMessage(param1:IDataInput) : void
      {
         this.self = param1.readBoolean();
         this.position = param1.readByte();
         this.accountNickname = param1.readUTF();
         this.characterName = param1.readUTF();
         this.areaId = param1.readShort();
      }
   }
}
