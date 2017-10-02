package com.ankamagames.dofus.network.messages.game.inventory.items
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class LivingObjectFeedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5724;
       
      
      private var _isInitialized:Boolean = false;
      
      public var livingUID:uint = 0;
      
      public var livingPosition:uint = 0;
      
      public var foodUID:uint = 0;
      
      public function LivingObjectFeedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5724;
      }
      
      public function initLivingObjectFeedMessage(param1:uint = 0, param2:uint = 0, param3:uint = 0) : LivingObjectFeedMessage
      {
         this.livingUID = param1;
         this.livingPosition = param2;
         this.foodUID = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.livingUID = 0;
         this.livingPosition = 0;
         this.foodUID = 0;
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
         this.serializeAs_LivingObjectFeedMessage(param1);
      }
      
      public function serializeAs_LivingObjectFeedMessage(param1:IDataOutput) : void
      {
         if(this.livingUID < 0)
         {
            throw new Error("Forbidden value (" + this.livingUID + ") on element livingUID.");
         }
         param1.writeInt(this.livingUID);
         if(this.livingPosition < 0 || this.livingPosition > 255)
         {
            throw new Error("Forbidden value (" + this.livingPosition + ") on element livingPosition.");
         }
         param1.writeByte(this.livingPosition);
         if(this.foodUID < 0)
         {
            throw new Error("Forbidden value (" + this.foodUID + ") on element foodUID.");
         }
         param1.writeInt(this.foodUID);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_LivingObjectFeedMessage(param1);
      }
      
      public function deserializeAs_LivingObjectFeedMessage(param1:IDataInput) : void
      {
         this.livingUID = param1.readInt();
         if(this.livingUID < 0)
         {
            throw new Error("Forbidden value (" + this.livingUID + ") on element of LivingObjectFeedMessage.livingUID.");
         }
         this.livingPosition = param1.readUnsignedByte();
         if(this.livingPosition < 0 || this.livingPosition > 255)
         {
            throw new Error("Forbidden value (" + this.livingPosition + ") on element of LivingObjectFeedMessage.livingPosition.");
         }
         this.foodUID = param1.readInt();
         if(this.foodUID < 0)
         {
            throw new Error("Forbidden value (" + this.foodUID + ") on element of LivingObjectFeedMessage.foodUID.");
         }
      }
   }
}
