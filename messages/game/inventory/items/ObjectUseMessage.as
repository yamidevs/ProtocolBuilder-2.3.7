package com.ankamagames.dofus.network.messages.game.inventory.items
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ObjectUseMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 3019;
       
      
      private var _isInitialized:Boolean = false;
      
      public var objectUID:uint = 0;
      
      public function ObjectUseMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 3019;
      }
      
      public function initObjectUseMessage(param1:uint = 0) : ObjectUseMessage
      {
         this.objectUID = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.objectUID = 0;
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
         this.serializeAs_ObjectUseMessage(param1);
      }
      
      public function serializeAs_ObjectUseMessage(param1:IDataOutput) : void
      {
         if(this.objectUID < 0)
         {
            throw new Error("Forbidden value (" + this.objectUID + ") on element objectUID.");
         }
         param1.writeInt(this.objectUID);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ObjectUseMessage(param1);
      }
      
      public function deserializeAs_ObjectUseMessage(param1:IDataInput) : void
      {
         this.objectUID = param1.readInt();
         if(this.objectUID < 0)
         {
            throw new Error("Forbidden value (" + this.objectUID + ") on element of ObjectUseMessage.objectUID.");
         }
      }
   }
}
