package com.ankamagames.dofus.network.messages.game.context.fight
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameFightHumanReadyStateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 740;
       
      
      private var _isInitialized:Boolean = false;
      
      public var characterId:uint = 0;
      
      public var isReady:Boolean = false;
      
      public function GameFightHumanReadyStateMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 740;
      }
      
      public function initGameFightHumanReadyStateMessage(param1:uint = 0, param2:Boolean = false) : GameFightHumanReadyStateMessage
      {
         this.characterId = param1;
         this.isReady = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.characterId = 0;
         this.isReady = false;
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
         this.serializeAs_GameFightHumanReadyStateMessage(param1);
      }
      
      public function serializeAs_GameFightHumanReadyStateMessage(param1:IDataOutput) : void
      {
         if(this.characterId < 0)
         {
            throw new Error("Forbidden value (" + this.characterId + ") on element characterId.");
         }
         param1.writeInt(this.characterId);
         param1.writeBoolean(this.isReady);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameFightHumanReadyStateMessage(param1);
      }
      
      public function deserializeAs_GameFightHumanReadyStateMessage(param1:IDataInput) : void
      {
         this.characterId = param1.readInt();
         if(this.characterId < 0)
         {
            throw new Error("Forbidden value (" + this.characterId + ") on element of GameFightHumanReadyStateMessage.characterId.");
         }
         this.isReady = param1.readBoolean();
      }
   }
}
