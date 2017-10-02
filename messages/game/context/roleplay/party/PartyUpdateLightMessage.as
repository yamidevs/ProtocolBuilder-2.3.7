package com.ankamagames.dofus.network.messages.game.context.roleplay.party
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PartyUpdateLightMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6054;
       
      
      private var _isInitialized:Boolean = false;
      
      public var id:uint = 0;
      
      public var lifePoints:uint = 0;
      
      public var maxLifePoints:uint = 0;
      
      public var prospecting:uint = 0;
      
      public var regenRate:uint = 0;
      
      public function PartyUpdateLightMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6054;
      }
      
      public function initPartyUpdateLightMessage(param1:uint = 0, param2:uint = 0, param3:uint = 0, param4:uint = 0, param5:uint = 0) : PartyUpdateLightMessage
      {
         this.id = param1;
         this.lifePoints = param2;
         this.maxLifePoints = param3;
         this.prospecting = param4;
         this.regenRate = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.id = 0;
         this.lifePoints = 0;
         this.maxLifePoints = 0;
         this.prospecting = 0;
         this.regenRate = 0;
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
         this.serializeAs_PartyUpdateLightMessage(param1);
      }
      
      public function serializeAs_PartyUpdateLightMessage(param1:IDataOutput) : void
      {
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element id.");
         }
         param1.writeInt(this.id);
         if(this.lifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.lifePoints + ") on element lifePoints.");
         }
         param1.writeInt(this.lifePoints);
         if(this.maxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.maxLifePoints + ") on element maxLifePoints.");
         }
         param1.writeInt(this.maxLifePoints);
         if(this.prospecting < 0)
         {
            throw new Error("Forbidden value (" + this.prospecting + ") on element prospecting.");
         }
         param1.writeShort(this.prospecting);
         if(this.regenRate < 0 || this.regenRate > 255)
         {
            throw new Error("Forbidden value (" + this.regenRate + ") on element regenRate.");
         }
         param1.writeByte(this.regenRate);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PartyUpdateLightMessage(param1);
      }
      
      public function deserializeAs_PartyUpdateLightMessage(param1:IDataInput) : void
      {
         this.id = param1.readInt();
         if(this.id < 0)
         {
            throw new Error("Forbidden value (" + this.id + ") on element of PartyUpdateLightMessage.id.");
         }
         this.lifePoints = param1.readInt();
         if(this.lifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.lifePoints + ") on element of PartyUpdateLightMessage.lifePoints.");
         }
         this.maxLifePoints = param1.readInt();
         if(this.maxLifePoints < 0)
         {
            throw new Error("Forbidden value (" + this.maxLifePoints + ") on element of PartyUpdateLightMessage.maxLifePoints.");
         }
         this.prospecting = param1.readShort();
         if(this.prospecting < 0)
         {
            throw new Error("Forbidden value (" + this.prospecting + ") on element of PartyUpdateLightMessage.prospecting.");
         }
         this.regenRate = param1.readUnsignedByte();
         if(this.regenRate < 0 || this.regenRate > 255)
         {
            throw new Error("Forbidden value (" + this.regenRate + ") on element of PartyUpdateLightMessage.regenRate.");
         }
      }
   }
}
