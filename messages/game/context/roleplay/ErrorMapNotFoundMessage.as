package com.ankamagames.dofus.network.messages.game.context.roleplay
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ErrorMapNotFoundMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6197;
       
      
      private var _isInitialized:Boolean = false;
      
      public var mapId:uint = 0;
      
      public function ErrorMapNotFoundMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6197;
      }
      
      public function initErrorMapNotFoundMessage(param1:uint = 0) : ErrorMapNotFoundMessage
      {
         this.mapId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.mapId = 0;
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
         this.serializeAs_ErrorMapNotFoundMessage(param1);
      }
      
      public function serializeAs_ErrorMapNotFoundMessage(param1:IDataOutput) : void
      {
         if(this.mapId < 0)
         {
            throw new Error("Forbidden value (" + this.mapId + ") on element mapId.");
         }
         param1.writeInt(this.mapId);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ErrorMapNotFoundMessage(param1);
      }
      
      public function deserializeAs_ErrorMapNotFoundMessage(param1:IDataInput) : void
      {
         this.mapId = param1.readInt();
         if(this.mapId < 0)
         {
            throw new Error("Forbidden value (" + this.mapId + ") on element of ErrorMapNotFoundMessage.mapId.");
         }
      }
   }
}
