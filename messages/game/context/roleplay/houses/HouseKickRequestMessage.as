package com.ankamagames.dofus.network.messages.game.context.roleplay.houses
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class HouseKickRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5698;
       
      
      private var _isInitialized:Boolean = false;
      
      public var id:uint = 0;
      
      public function HouseKickRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5698;
      }
      
      public function initHouseKickRequestMessage(param1:uint = 0) : HouseKickRequestMessage
      {
         this.id = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.id = 0;
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
         this.serializeAs_HouseKickRequestMessage(param1);
      }
      
      public function serializeAs_HouseKickRequestMessage(param1:IDataOutput) : void
      {
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element id.");
         }
         param1.writeInt(this.id);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_HouseKickRequestMessage(param1);
      }
      
      public function deserializeAs_HouseKickRequestMessage(param1:IDataInput) : void
      {
         this.id = param1.readInt();
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element of HouseKickRequestMessage.id.");
         }
      }
   }
}
