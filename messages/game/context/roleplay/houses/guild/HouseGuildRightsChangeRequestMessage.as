package com.ankamagames.dofus.network.messages.game.context.roleplay.houses.guild
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class HouseGuildRightsChangeRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5702;
       
      
      private var _isInitialized:Boolean = false;
      
      public var rights:uint = 0;
      
      public function HouseGuildRightsChangeRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5702;
      }
      
      public function initHouseGuildRightsChangeRequestMessage(param1:uint = 0) : HouseGuildRightsChangeRequestMessage
      {
         this.rights = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.rights = 0;
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
         this.serializeAs_HouseGuildRightsChangeRequestMessage(param1);
      }
      
      public function serializeAs_HouseGuildRightsChangeRequestMessage(param1:IDataOutput) : void
      {
         if(this.rights < 0 || this.rights > 4294967295)
         {
            throw new Error("Forbidden value (" + this.rights + ") on element rights.");
         }
         param1.writeUnsignedInt(this.rights);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_HouseGuildRightsChangeRequestMessage(param1);
      }
      
      public function deserializeAs_HouseGuildRightsChangeRequestMessage(param1:IDataInput) : void
      {
         this.rights = param1.readUnsignedInt();
         if(this.rights < 0 || this.rights > 4294967295)
         {
            throw new Error("Forbidden value (" + this.rights + ") on element of HouseGuildRightsChangeRequestMessage.rights.");
         }
      }
   }
}
