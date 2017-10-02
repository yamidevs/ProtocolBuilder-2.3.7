package com.ankamagames.dofus.network.messages.game.pvp
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AlignmentAreaUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6060;
       
      
      private var _isInitialized:Boolean = false;
      
      public var areaId:uint = 0;
      
      public var side:int = 0;
      
      public function AlignmentAreaUpdateMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6060;
      }
      
      public function initAlignmentAreaUpdateMessage(param1:uint = 0, param2:int = 0) : AlignmentAreaUpdateMessage
      {
         this.areaId = param1;
         this.side = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.areaId = 0;
         this.side = 0;
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
         this.serializeAs_AlignmentAreaUpdateMessage(param1);
      }
      
      public function serializeAs_AlignmentAreaUpdateMessage(param1:IDataOutput) : void
      {
         if(this.areaId < 0)
         {
            throw new Error("Forbidden value (" + this.areaId + ") on element areaId.");
         }
         param1.writeShort(this.areaId);
         param1.writeByte(this.side);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AlignmentAreaUpdateMessage(param1);
      }
      
      public function deserializeAs_AlignmentAreaUpdateMessage(param1:IDataInput) : void
      {
         this.areaId = param1.readShort();
         if(this.areaId < 0)
         {
            throw new Error("Forbidden value (" + this.areaId + ") on element of AlignmentAreaUpdateMessage.areaId.");
         }
         this.side = param1.readByte();
      }
   }
}
