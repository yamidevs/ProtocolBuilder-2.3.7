package com.ankamagames.dofus.network.messages.game.actions
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AbstractGameActionMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1000;
       
      
      private var _isInitialized:Boolean = false;
      
      public var actionId:uint = 0;
      
      public var sourceId:int = 0;
      
      public function AbstractGameActionMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 1000;
      }
      
      public function initAbstractGameActionMessage(param1:uint = 0, param2:int = 0) : AbstractGameActionMessage
      {
         this.actionId = param1;
         this.sourceId = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.actionId = 0;
         this.sourceId = 0;
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
         this.serializeAs_AbstractGameActionMessage(param1);
      }
      
      public function serializeAs_AbstractGameActionMessage(param1:IDataOutput) : void
      {
         if(this.actionId < 0)
         {
            throw new Error("Forbidden value (" + this.actionId + ") on element actionId.");
         }
         param1.writeShort(this.actionId);
         param1.writeInt(this.sourceId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AbstractGameActionMessage(param1);
      }
      
      public function deserializeAs_AbstractGameActionMessage(param1:IDataInput) : void
      {
         this.actionId = param1.readShort();
         if(this.actionId < 0)
         {
            throw new Error("Forbidden value (" + this.actionId + ") on element of AbstractGameActionMessage.actionId.");
         }
         this.sourceId = param1.readInt();
      }
   }
}
