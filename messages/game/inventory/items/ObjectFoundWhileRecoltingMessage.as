package com.ankamagames.dofus.network.messages.game.inventory.items
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ObjectFoundWhileRecoltingMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6017;
       
      
      private var _isInitialized:Boolean = false;
      
      public var genericId:uint = 0;
      
      public var quantity:uint = 0;
      
      public var ressourceGenericId:uint = 0;
      
      public function ObjectFoundWhileRecoltingMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6017;
      }
      
      public function initObjectFoundWhileRecoltingMessage(param1:uint = 0, param2:uint = 0, param3:uint = 0) : ObjectFoundWhileRecoltingMessage
      {
         this.genericId = param1;
         this.quantity = param2;
         this.ressourceGenericId = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.genericId = 0;
         this.quantity = 0;
         this.ressourceGenericId = 0;
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
         this.serializeAs_ObjectFoundWhileRecoltingMessage(param1);
      }
      
      public function serializeAs_ObjectFoundWhileRecoltingMessage(param1:IDataOutput) : void
      {
         if(this.genericId < 0)
         {
            throw new Error("Forbidden value (" + this.genericId + ") on element genericId.");
         }
         param1.writeInt(this.genericId);
         if(this.quantity < 0)
         {
            throw new Error("Forbidden value (" + this.quantity + ") on element quantity.");
         }
         param1.writeInt(this.quantity);
         if(this.ressourceGenericId < 0)
         {
            throw new Error("Forbidden value (" + this.ressourceGenericId + ") on element ressourceGenericId.");
         }
         param1.writeInt(this.ressourceGenericId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ObjectFoundWhileRecoltingMessage(param1);
      }
      
      public function deserializeAs_ObjectFoundWhileRecoltingMessage(param1:IDataInput) : void
      {
         this.genericId = param1.readInt();
         if(this.genericId < 0)
         {
            throw new Error("Forbidden value (" + this.genericId + ") on element of ObjectFoundWhileRecoltingMessage.genericId.");
         }
         this.quantity = param1.readInt();
         if(this.quantity < 0)
         {
            throw new Error("Forbidden value (" + this.quantity + ") on element of ObjectFoundWhileRecoltingMessage.quantity.");
         }
         this.ressourceGenericId = param1.readInt();
         if(this.ressourceGenericId < 0)
         {
            throw new Error("Forbidden value (" + this.ressourceGenericId + ") on element of ObjectFoundWhileRecoltingMessage.ressourceGenericId.");
         }
      }
   }
}
