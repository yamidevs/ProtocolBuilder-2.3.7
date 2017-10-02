package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismFightAttackedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5894;
       
      
      private var _isInitialized:Boolean = false;
      
      public var worldX:int = 0;
      
      public var worldY:int = 0;
      
      public var mapId:int = 0;
      
      public var subareaId:uint = 0;
      
      public var prismSide:int = 0;
      
      public function PrismFightAttackedMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5894;
      }
      
      public function initPrismFightAttackedMessage(param1:int = 0, param2:int = 0, param3:int = 0, param4:uint = 0, param5:int = 0) : PrismFightAttackedMessage
      {
         this.worldX = param1;
         this.worldY = param2;
         this.mapId = param3;
         this.subareaId = param4;
         this.prismSide = param5;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.worldX = 0;
         this.worldY = 0;
         this.mapId = 0;
         this.subareaId = 0;
         this.prismSide = 0;
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
         this.serializeAs_PrismFightAttackedMessage(param1);
      }
      
      public function serializeAs_PrismFightAttackedMessage(param1:IDataOutput) : void
      {
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element worldX.");
         }
         param1.writeShort(this.worldX);
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element worldY.");
         }
         param1.writeShort(this.worldY);
         param1.writeInt(this.mapId);
         if(this.subareaId < 0)
         {
            throw new Error("Forbidden value (" + this.subareaId + ") on element subareaId.");
         }
         param1.writeShort(this.subareaId);
         param1.writeByte(this.prismSide);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismFightAttackedMessage(param1);
      }
      
      public function deserializeAs_PrismFightAttackedMessage(param1:IDataInput) : void
      {
         this.worldX = param1.readShort();
         if(this.worldX < -255 || this.worldX > 255)
         {
            throw new Error("Forbidden value (" + this.worldX + ") on element of PrismFightAttackedMessage.worldX.");
         }
         this.worldY = param1.readShort();
         if(this.worldY < -255 || this.worldY > 255)
         {
            throw new Error("Forbidden value (" + this.worldY + ") on element of PrismFightAttackedMessage.worldY.");
         }
         this.mapId = param1.readInt();
         this.subareaId = param1.readShort();
         if(this.subareaId < 0)
         {
            throw new Error("Forbidden value (" + this.subareaId + ") on element of PrismFightAttackedMessage.subareaId.");
         }
         this.prismSide = param1.readByte();
      }
   }
}
