package com.ankamagames.dofus.network.types.game.prism
{
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.BooleanByteWrapper;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class PrismConquestInformation implements INetworkType
   {
      
      public static const protocolId:uint = 152;
       
      
      public var subId:uint = 0;
      
      public var alignment:uint = 0;
      
      public var isEntered:Boolean = false;
      
      public var isInRoom:Boolean = false;
      
      public function PrismConquestInformation()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 152;
      }
      
      public function initPrismConquestInformation(param1:uint = 0, param2:uint = 0, param3:Boolean = false, param4:Boolean = false) : PrismConquestInformation
      {
         this.subId = param1;
         this.alignment = param2;
         this.isEntered = param3;
         this.isInRoom = param4;
         return this;
      }
      
      public function reset() : void
      {
         this.subId = 0;
         this.alignment = 0;
         this.isEntered = false;
         this.isInRoom = false;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_PrismConquestInformation(param1);
      }
      
      public function serializeAs_PrismConquestInformation(param1:IDataOutput) : void
      {
         var _loc2_:uint = 0;
         BooleanByteWrapper.setFlag(_loc2_,0,this.isEntered);
         BooleanByteWrapper.setFlag(_loc2_,1,this.isInRoom);
         param1.writeByte(_loc2_);
         if(this.subId < 0)
         {
            throw new Error("Forbidden value (" + this.subId + ") on element subId.");
         }
         param1.writeInt(this.subId);
         if(this.alignment < 0)
         {
            throw new Error("Forbidden value (" + this.alignment + ") on element alignment.");
         }
         param1.writeByte(this.alignment);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismConquestInformation(param1);
      }
      
      public function deserializeAs_PrismConquestInformation(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readByte();
         this.isEntered = BooleanByteWrapper.getFlag(_loc2_,0);
         this.isInRoom = BooleanByteWrapper.getFlag(_loc2_,1);
         this.subId = param1.readInt();
         if(this.subId < 0)
         {
            throw new Error("Forbidden value (" + this.subId + ") on element of PrismConquestInformation.subId.");
         }
         this.alignment = param1.readByte();
         if(this.alignment < 0)
         {
            throw new Error("Forbidden value (" + this.alignment + ") on element of PrismConquestInformation.alignment.");
         }
      }
   }
}
