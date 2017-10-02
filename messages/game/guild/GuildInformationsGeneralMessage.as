package com.ankamagames.dofus.network.messages.game.guild
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GuildInformationsGeneralMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5557;
       
      
      private var _isInitialized:Boolean = false;
      
      public var enabled:Boolean = false;
      
      public var level:uint = 0;
      
      public var expLevelFloor:Number = 0;
      
      public var experience:Number = 0;
      
      public var expNextLevelFloor:Number = 0;
      
      public function GuildInformationsGeneralMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5557;
      }
      
      public function initGuildInformationsGeneralMessage(param1:Boolean = false, param2:uint = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : GuildInformationsGeneralMessage
      {
         this.enabled = param1;
         this.level = param2;
         this.expLevelFloor = param3;
         this.experience = param4;
         this.expNextLevelFloor = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.enabled = false;
         this.level = 0;
         this.expLevelFloor = 0;
         this.experience = 0;
         this.expNextLevelFloor = 0;
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
         this.serializeAs_GuildInformationsGeneralMessage(param1);
      }
      
      public function serializeAs_GuildInformationsGeneralMessage(param1:IDataOutput) : void
      {
         param1.writeBoolean(this.enabled);
         if(this.level < 0 || this.level > 255)
         {
            throw new Error("Forbidden value (" + this.level + ") on element level.");
         }
         param1.writeByte(this.level);
         if(this.expLevelFloor < 0)
         {
            throw new Error("Forbidden value (" + this.expLevelFloor + ") on element expLevelFloor.");
         }
         param1.writeDouble(this.expLevelFloor);
         if(this.experience < 0)
         {
            throw new Error("Forbidden value (" + this.experience + ") on element experience.");
         }
         param1.writeDouble(this.experience);
         if(this.expNextLevelFloor < 0)
         {
            throw new Error("Forbidden value (" + this.expNextLevelFloor + ") on element expNextLevelFloor.");
         }
         param1.writeDouble(this.expNextLevelFloor);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GuildInformationsGeneralMessage(param1);
      }
      
      public function deserializeAs_GuildInformationsGeneralMessage(param1:IDataInput) : void
      {
         this.enabled = param1.readBoolean();
         this.level = param1.readUnsignedByte();
         if(this.level < 0 || this.level > 255)
         {
            throw new Error("Forbidden value (" + this.level + ") on element of GuildInformationsGeneralMessage.level.");
         }
         this.expLevelFloor = param1.readDouble();
         if(this.expLevelFloor < 0)
         {
            throw new Error("Forbidden value (" + this.expLevelFloor + ") on element of GuildInformationsGeneralMessage.expLevelFloor.");
         }
         this.experience = param1.readDouble();
         if(this.experience < 0)
         {
            throw new Error("Forbidden value (" + this.experience + ") on element of GuildInformationsGeneralMessage.experience.");
         }
         this.expNextLevelFloor = param1.readDouble();
         if(this.expNextLevelFloor < 0)
         {
            throw new Error("Forbidden value (" + this.expNextLevelFloor + ") on element of GuildInformationsGeneralMessage.expNextLevelFloor.");
         }
      }
   }
}
