package com.ankamagames.dofus.network.messages.game.context.roleplay.objects
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ObjectGroundRemovedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 3014;
       
      
      private var _isInitialized:Boolean = false;
      
      public var cell:uint = 0;
      
      public function ObjectGroundRemovedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 3014;
      }
      
      public function initObjectGroundRemovedMessage(param1:uint = 0) : ObjectGroundRemovedMessage
      {
         this.cell = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.cell = 0;
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
         this.serializeAs_ObjectGroundRemovedMessage(param1);
      }
      
      public function serializeAs_ObjectGroundRemovedMessage(param1:IDataOutput) : void
      {
         if(this.cell < 0 || this.cell > 559)
         {
            throw new Error("Forbidden value (" + this.cell + ") on element cell.");
         }
         param1.writeShort(this.cell);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ObjectGroundRemovedMessage(param1);
      }
      
      public function deserializeAs_ObjectGroundRemovedMessage(param1:IDataInput) : void
      {
         this.cell = param1.readShort();
         if(this.cell < 0 || this.cell > 559)
         {
            throw new Error("Forbidden value (" + this.cell + ") on element of ObjectGroundRemovedMessage.cell.");
         }
      }
   }
}
