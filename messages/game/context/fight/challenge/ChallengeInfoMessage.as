package com.ankamagames.dofus.network.messages.game.context.fight.challenge
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class ChallengeInfoMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6022;
       
      
      private var _isInitialized:Boolean = false;
      
      public var challengeId:uint = 0;
      
      public var targetId:int = 0;
      
      public var baseXpBonus:uint = 0;
      
      public var extraXpBonus:uint = 0;
      
      public var baseDropBonus:uint = 0;
      
      public var extraDropBonus:uint = 0;
      
      public function ChallengeInfoMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6022;
      }
      
      public function initChallengeInfoMessage(param1:uint = 0, param2:int = 0, param3:uint = 0, param4:uint = 0, param5:uint = 0, param6:uint = 0) : ChallengeInfoMessage
      {
         this.challengeId = param1;
         this.targetId = param2;
         this.baseXpBonus = param3;
         this.extraXpBonus = param4;
         this.baseDropBonus = param5;
         this.extraDropBonus = param6;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.challengeId = 0;
         this.targetId = 0;
         this.baseXpBonus = 0;
         this.extraXpBonus = 0;
         this.baseDropBonus = 0;
         this.extraDropBonus = 0;
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
         this.serializeAs_ChallengeInfoMessage(param1);
      }
      
      public function serializeAs_ChallengeInfoMessage(param1:IDataOutput) : void
      {
         if(this.challengeId < 0)
         {
            throw new Error("Forbidden value (" + this.challengeId + ") on element challengeId.");
         }
         param1.writeByte(this.challengeId);
         param1.writeInt(this.targetId);
         if(this.baseXpBonus < 0)
         {
            throw new Error("Forbidden value (" + this.baseXpBonus + ") on element baseXpBonus.");
         }
         param1.writeInt(this.baseXpBonus);
         if(this.extraXpBonus < 0)
         {
            throw new Error("Forbidden value (" + this.extraXpBonus + ") on element extraXpBonus.");
         }
         param1.writeInt(this.extraXpBonus);
         if(this.baseDropBonus < 0)
         {
            throw new Error("Forbidden value (" + this.baseDropBonus + ") on element baseDropBonus.");
         }
         param1.writeInt(this.baseDropBonus);
         if(this.extraDropBonus < 0)
         {
            throw new Error("Forbidden value (" + this.extraDropBonus + ") on element extraDropBonus.");
         }
         param1.writeInt(this.extraDropBonus);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_ChallengeInfoMessage(param1);
      }
      
      public function deserializeAs_ChallengeInfoMessage(param1:IDataInput) : void
      {
         this.challengeId = param1.readByte();
         if(this.challengeId < 0)
         {
            throw new Error("Forbidden value (" + this.challengeId + ") on element of ChallengeInfoMessage.challengeId.");
         }
         this.targetId = param1.readInt();
         this.baseXpBonus = param1.readInt();
         if(this.baseXpBonus < 0)
         {
            throw new Error("Forbidden value (" + this.baseXpBonus + ") on element of ChallengeInfoMessage.baseXpBonus.");
         }
         this.extraXpBonus = param1.readInt();
         if(this.extraXpBonus < 0)
         {
            throw new Error("Forbidden value (" + this.extraXpBonus + ") on element of ChallengeInfoMessage.extraXpBonus.");
         }
         this.baseDropBonus = param1.readInt();
         if(this.baseDropBonus < 0)
         {
            throw new Error("Forbidden value (" + this.baseDropBonus + ") on element of ChallengeInfoMessage.baseDropBonus.");
         }
         this.extraDropBonus = param1.readInt();
         if(this.extraDropBonus < 0)
         {
            throw new Error("Forbidden value (" + this.extraDropBonus + ") on element of ChallengeInfoMessage.extraDropBonus.");
         }
      }
   }
}
