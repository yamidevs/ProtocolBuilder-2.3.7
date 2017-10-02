package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.dofus.network.types.game.prism.AlignmentBonusInformations;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismAlignmentBonusResultMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5842;
       
      
      private var _isInitialized:Boolean = false;
      
      public var alignmentBonus:AlignmentBonusInformations;
      
      public function PrismAlignmentBonusResultMessage()
      {
         this.alignmentBonus = new AlignmentBonusInformations();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5842;
      }
      
      public function initPrismAlignmentBonusResultMessage(param1:AlignmentBonusInformations = null) : PrismAlignmentBonusResultMessage
      {
         this.alignmentBonus = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.alignmentBonus = new AlignmentBonusInformations();
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
         this.serializeAs_PrismAlignmentBonusResultMessage(param1);
      }
      
      public function serializeAs_PrismAlignmentBonusResultMessage(param1:IDataOutput) : void
      {
         this.alignmentBonus.serializeAs_AlignmentBonusInformations(param1);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismAlignmentBonusResultMessage(param1);
      }
      
      public function deserializeAs_PrismAlignmentBonusResultMessage(param1:IDataInput) : void
      {
         this.alignmentBonus = new AlignmentBonusInformations();
         this.alignmentBonus.deserialize(param1);
      }
   }
}
