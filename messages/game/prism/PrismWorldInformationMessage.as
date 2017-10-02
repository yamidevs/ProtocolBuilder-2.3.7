package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.dofus.network.types.game.prism.PrismConquestInformation;
   import com.ankamagames.dofus.network.types.game.prism.PrismSubAreaInformation;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   [Trusted]
   public class PrismWorldInformationMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5854;
       
      
      private var _isInitialized:Boolean = false;
      
      public var nbSubOwned:uint = 0;
      
      public var subTotal:uint = 0;
      
      public var maxSub:uint = 0;
      
      public var subAreasInformation:Vector.<PrismSubAreaInformation>;
      
      public var nbConqsOwned:uint = 0;
      
      public var conqsTotal:uint = 0;
      
      public var conquetesInformation:Vector.<PrismConquestInformation>;
      
      public function PrismWorldInformationMessage()
      {
         this.subAreasInformation = new Vector.<PrismSubAreaInformation>();
         this.conquetesInformation = new Vector.<PrismConquestInformation>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5854;
      }
      
      public function initPrismWorldInformationMessage(param1:uint = 0, param2:uint = 0, param3:uint = 0, param4:Vector.<PrismSubAreaInformation> = null, param5:uint = 0, param6:uint = 0, param7:Vector.<PrismConquestInformation> = null) : PrismWorldInformationMessage
      {
         this.nbSubOwned = param1;
         this.subTotal = param2;
         this.maxSub = param3;
         this.subAreasInformation = param4;
         this.nbConqsOwned = param5;
         this.conqsTotal = param6;
         this.conquetesInformation = param7;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.nbSubOwned = 0;
         this.subTotal = 0;
         this.maxSub = 0;
         this.subAreasInformation = new Vector.<PrismSubAreaInformation>();
         this.nbConqsOwned = 0;
         this.conqsTotal = 0;
         this.conquetesInformation = new Vector.<PrismConquestInformation>();
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
         this.serializeAs_PrismWorldInformationMessage(param1);
      }
      
      public function serializeAs_PrismWorldInformationMessage(param1:IDataOutput) : void
      {
         if(this.nbSubOwned < 0)
         {
            throw new Error("Forbidden value (" + this.nbSubOwned + ") on element nbSubOwned.");
         }
         param1.writeInt(this.nbSubOwned);
         if(this.subTotal < 0)
         {
            throw new Error("Forbidden value (" + this.subTotal + ") on element subTotal.");
         }
         param1.writeInt(this.subTotal);
         if(this.maxSub < 0)
         {
            throw new Error("Forbidden value (" + this.maxSub + ") on element maxSub.");
         }
         param1.writeInt(this.maxSub);
         param1.writeShort(this.subAreasInformation.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.subAreasInformation.length)
         {
            (this.subAreasInformation[_loc2_] as PrismSubAreaInformation).serializeAs_PrismSubAreaInformation(param1);
            _loc2_++;
         }
         if(this.nbConqsOwned < 0)
         {
            throw new Error("Forbidden value (" + this.nbConqsOwned + ") on element nbConqsOwned.");
         }
         param1.writeInt(this.nbConqsOwned);
         if(this.conqsTotal < 0)
         {
            throw new Error("Forbidden value (" + this.conqsTotal + ") on element conqsTotal.");
         }
         param1.writeInt(this.conqsTotal);
         param1.writeShort(this.conquetesInformation.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.conquetesInformation.length)
         {
            (this.conquetesInformation[_loc3_] as PrismConquestInformation).serializeAs_PrismConquestInformation(param1);
            _loc3_++;
         }
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_PrismWorldInformationMessage(param1);
      }
      
      public function deserializeAs_PrismWorldInformationMessage(param1:IDataInput) : void
      {
         var _loc6_:PrismSubAreaInformation = null;
         var _loc7_:PrismConquestInformation = null;
         this.nbSubOwned = param1.readInt();
         if(this.nbSubOwned < 0)
         {
            throw new Error("Forbidden value (" + this.nbSubOwned + ") on element of PrismWorldInformationMessage.nbSubOwned.");
         }
         this.subTotal = param1.readInt();
         if(this.subTotal < 0)
         {
            throw new Error("Forbidden value (" + this.subTotal + ") on element of PrismWorldInformationMessage.subTotal.");
         }
         this.maxSub = param1.readInt();
         if(this.maxSub < 0)
         {
            throw new Error("Forbidden value (" + this.maxSub + ") on element of PrismWorldInformationMessage.maxSub.");
         }
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = new PrismSubAreaInformation();
            _loc6_.deserialize(param1);
            this.subAreasInformation.push(_loc6_);
            _loc3_++;
         }
         this.nbConqsOwned = param1.readInt();
         if(this.nbConqsOwned < 0)
         {
            throw new Error("Forbidden value (" + this.nbConqsOwned + ") on element of PrismWorldInformationMessage.nbConqsOwned.");
         }
         this.conqsTotal = param1.readInt();
         if(this.conqsTotal < 0)
         {
            throw new Error("Forbidden value (" + this.conqsTotal + ") on element of PrismWorldInformationMessage.conqsTotal.");
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = new PrismConquestInformation();
            _loc7_.deserialize(param1);
            this.conquetesInformation.push(_loc7_);
            _loc5_++;
         }
      }
   }
}
