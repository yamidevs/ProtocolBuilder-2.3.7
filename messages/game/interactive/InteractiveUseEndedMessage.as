package com.ankamagames.dofus.network.messages.game.interactive
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class InteractiveUseEndedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6112;
       
      
      private var _isInitialized:Boolean = false;
      
      public var elemId:uint = 0;
      
      public var skillId:uint = 0;
      
      public function InteractiveUseEndedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6112;
      }
      
      public function initInteractiveUseEndedMessage(param1:uint = 0, param2:uint = 0) : InteractiveUseEndedMessage
      {
         this.elemId = param1;
         this.skillId = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.elemId = 0;
         this.skillId = 0;
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
         this.serializeAs_InteractiveUseEndedMessage(param1);
      }
      
      public function serializeAs_InteractiveUseEndedMessage(param1:IDataOutput) : void
      {
         if(this.elemId < 0)
         {
            throw new Error("Forbidden value (" + this.elemId + ") on element elemId.");
         }
         param1.writeInt(this.elemId);
         if(this.skillId < 0)
         {
            throw new Error("Forbidden value (" + this.skillId + ") on element skillId.");
         }
         param1.writeShort(this.skillId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_InteractiveUseEndedMessage(param1);
      }
      
      public function deserializeAs_InteractiveUseEndedMessage(param1:IDataInput) : void
      {
         this.elemId = param1.readInt();
         if(this.elemId < 0)
         {
            throw new Error("Forbidden value (" + this.elemId + ") on element of InteractiveUseEndedMessage.elemId.");
         }
         this.skillId = param1.readShort();
         if(this.skillId < 0)
         {
            throw new Error("Forbidden value (" + this.skillId + ") on element of InteractiveUseEndedMessage.skillId.");
         }
      }
   }
}
