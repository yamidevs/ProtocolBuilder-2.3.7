package com.ankamagames.dofus.network.messages.game.script
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class CinematicMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6053;
       
      
      private var _isInitialized:Boolean = false;
      
      public var cinematicId:uint = 0;
      
      public function CinematicMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6053;
      }
      
      public function initCinematicMessage(param1:uint = 0) : CinematicMessage
      {
         this.cinematicId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.cinematicId = 0;
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
         this.serializeAs_CinematicMessage(param1);
      }
      
      public function serializeAs_CinematicMessage(param1:IDataOutput) : void
      {
         if(this.cinematicId < 0)
         {
            throw new Error("Forbidden value (" + this.cinematicId + ") on element cinematicId.");
         }
         param1.writeShort(this.cinematicId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_CinematicMessage(param1);
      }
      
      public function deserializeAs_CinematicMessage(param1:IDataInput) : void
      {
         this.cinematicId = param1.readShort();
         if(this.cinematicId < 0)
         {
            throw new Error("Forbidden value (" + this.cinematicId + ") on element of CinematicMessage.cinematicId.");
         }
      }
   }
}
