package com.ankamagames.dofus.network.types.game.prism
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class AlignmentBonusInformations implements INetworkType
   {
      
      public static const protocolId:uint = 135;
       
      
      public var pctbonus:uint = 0;
      
      public var grademult:Number = 0;
      
      public function AlignmentBonusInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 135;
      }
      
      public function initAlignmentBonusInformations(param1:uint = 0, param2:Number = 0) : AlignmentBonusInformations
      {
         this.pctbonus = param1;
         this.grademult = param2;
         return this;
      }
      
      public function reset() : void
      {
         this.pctbonus = 0;
         this.grademult = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_AlignmentBonusInformations(param1);
      }
      
      public function serializeAs_AlignmentBonusInformations(param1:IDataOutput) : void
      {
         if(this.pctbonus < 0)
         {
            throw new Error("Forbidden value (" + this.pctbonus + ") on element pctbonus.");
         }
         param1.writeInt(this.pctbonus);
         param1.writeDouble(this.grademult);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_AlignmentBonusInformations(param1);
      }
      
      public function deserializeAs_AlignmentBonusInformations(param1:IDataInput) : void
      {
         this.pctbonus = param1.readInt();
         if(this.pctbonus < 0)
         {
            throw new Error("Forbidden value (" + this.pctbonus + ") on element of AlignmentBonusInformations.pctbonus.");
         }
         this.grademult = param1.readDouble();
      }
   }
}
