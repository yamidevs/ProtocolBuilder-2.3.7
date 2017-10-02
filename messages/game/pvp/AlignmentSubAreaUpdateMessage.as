package com.ankamagames.dofus.network.messages.game.pvp
{
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class AlignmentSubAreaUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6057;
       
      
      private var _isInitialized:Boolean = false;
      
      public var subAreaId:uint = 0;
      
      public var side:int = 0;
      
      public var quiet:Boolean = false;
      
      public function AlignmentSubAreaUpdateMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6057;
      }
      
      public function initAlignmentSubAreaUpdateMessage(param1:uint = 0, param2:int = 0, param3:Boolean = false) : AlignmentSubAreaUpdateMessage
      {
         this.subAreaId = param1;
         this.side = param2;
         this.quiet = param3;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.subAreaId = 0;
         this.side = 0;
         this.quiet = false;
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
         this.serializeAs_AlignmentSubAreaUpdateMessage(param1);
      }
      
      public function serializeAs_AlignmentSubAreaUpdateMessage(param1:IDataOutput) : void
      {
         if(this.subAreaId < 0)
         {
            throw new Error("Forbidden value (" + this.subAreaId + ") on element subAreaId.");
         }
         param1.writeShort(this.subAreaId);
         param1.writeByte(this.side);
         param1.writeBoolean(this.quiet);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AlignmentSubAreaUpdateMessage(param1);
      }
      
      public function deserializeAs_AlignmentSubAreaUpdateMessage(param1:IDataInput) : void
      {
         this.subAreaId = param1.readShort();
         if(this.subAreaId < 0)
         {
            throw new Error("Forbidden value (" + this.subAreaId + ") on element of AlignmentSubAreaUpdateMessage.subAreaId.");
         }
         this.side = param1.readByte();
         this.quiet = param1.readBoolean();
      }
   }
}
