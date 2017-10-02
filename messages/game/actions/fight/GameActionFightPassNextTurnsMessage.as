package com.ankamagames.dofus.network.messages.game.actions.fight
{
   import com.ankamagames.dofus.network.messages.game.actions.AbstractGameActionMessage;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class GameActionFightPassNextTurnsMessage extends AbstractGameActionMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5529;
       
      
      private var _isInitialized:Boolean = false;
      
      public var targetId:int = 0;
      
      public var turnCount:uint = 0;
      
      public function GameActionFightPassNextTurnsMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5529;
      }
      
      public function initGameActionFightPassNextTurnsMessage(param1:uint = 0, param2:int = 0, param3:int = 0, param4:uint = 0) : GameActionFightPassNextTurnsMessage
      {
         super.initAbstractGameActionMessage(param1,param2);
         this.targetId = param3;
         this.turnCount = param4;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.targetId = 0;
         this.turnCount = 0;
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
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_GameActionFightPassNextTurnsMessage(param1);
      }
      
      public function serializeAs_GameActionFightPassNextTurnsMessage(param1:IDataOutput) : void
      {
         super.serializeAs_AbstractGameActionMessage(param1);
         param1.writeInt(this.targetId);
         if(this.turnCount < 0)
         {
            throw new Error("Forbidden value (" + this.turnCount + ") on element turnCount.");
         }
         param1.writeByte(this.turnCount);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_GameActionFightPassNextTurnsMessage(param1);
      }
      
      public function deserializeAs_GameActionFightPassNextTurnsMessage(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.targetId = param1.readInt();
         this.turnCount = param1.readByte();
         if(this.turnCount < 0)
         {
            throw new Error("Forbidden value (" + this.turnCount + ") on element of GameActionFightPassNextTurnsMessage.turnCount.");
         }
      }
   }
}
