package com.ankamagames.dofus.network.messages.game.context.fight
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameFightStartingMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 700;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fightType:uint = 0;
      
      public function GameFightStartingMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 700;
      }
      
      public function initGameFightStartingMessage(param1:uint = 0) : GameFightStartingMessage
      {
         this.fightType = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fightType = 0;
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
         this.serializeAs_GameFightStartingMessage(param1);
      }
      
      public function serializeAs_GameFightStartingMessage(param1:IDataOutput) : void
      {
         param1.writeByte(this.fightType);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameFightStartingMessage(param1);
      }
      
      public function deserializeAs_GameFightStartingMessage(param1:IDataInput) : void
      {
         this.fightType = param1.readByte();
         if(this.fightType < 0)
         {
            throw new Error("Forbidden value (" + this.fightType + ") on element of GameFightStartingMessage.fightType.");
         }
      }
   }
}
