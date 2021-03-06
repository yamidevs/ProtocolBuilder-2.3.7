package com.ankamagames.dofus.network.types.game.data.items
{
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class SellerBuyerDescriptor implements INetworkType
   {
      
      public static const protocolId:uint = 121;
       
      
      public var quantities:Vector.<uint>;
      
      public var types:Vector.<uint>;
      
      public var taxPercentage:Number = 0;
      
      public var maxItemLevel:uint = 0;
      
      public var maxItemPerAccount:uint = 0;
      
      public var npcContextualId:int = 0;
      
      public var unsoldDelay:uint = 0;
      
      public function SellerBuyerDescriptor()
      {
         this.quantities = new Vector.<uint>();
         this.types = new Vector.<uint>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 121;
      }
      
      public function initSellerBuyerDescriptor(param1:Vector.<uint> = null, param2:Vector.<uint> = null, param3:Number = 0, param4:uint = 0, param5:uint = 0, param6:int = 0, param7:uint = 0) : SellerBuyerDescriptor
      {
         this.quantities = param1;
         this.types = param2;
         this.taxPercentage = param3;
         this.maxItemLevel = param4;
         this.maxItemPerAccount = param5;
         this.npcContextualId = param6;
         this.unsoldDelay = param7;
         return this;
      }
      
      public function reset() : void
      {
         this.quantities = new Vector.<uint>();
         this.types = new Vector.<uint>();
         this.taxPercentage = 0;
         this.maxItemLevel = 0;
         this.maxItemPerAccount = 0;
         this.npcContextualId = 0;
         this.unsoldDelay = 0;
      }
      
      public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_SellerBuyerDescriptor(param1);
      }
      
      public function serializeAs_SellerBuyerDescriptor(param1:IDataOutput) : void
      {
         param1.writeShort(this.quantities.length);
         var _loc2_:uint = 0;
         while(_loc2_ < this.quantities.length)
         {
            if(this.quantities[_loc2_] < 0)
            {
               throw new Error("Forbidden value (" + this.quantities[_loc2_] + ") on element 1 (starting at 1) of quantities.");
            }
            param1.writeInt(this.quantities[_loc2_]);
            _loc2_++;
         }
         param1.writeShort(this.types.length);
         var _loc3_:uint = 0;
         while(_loc3_ < this.types.length)
         {
            if(this.types[_loc3_] < 0)
            {
               throw new Error("Forbidden value (" + this.types[_loc3_] + ") on element 2 (starting at 1) of types.");
            }
            param1.writeInt(this.types[_loc3_]);
            _loc3_++;
         }
         param1.writeFloat(this.taxPercentage);
         if(this.maxItemLevel < 0)
         {
            throw new Error("Forbidden value (" + this.maxItemLevel + ") on element maxItemLevel.");
         }
         param1.writeInt(this.maxItemLevel);
         if(this.maxItemPerAccount < 0)
         {
            throw new Error("Forbidden value (" + this.maxItemPerAccount + ") on element maxItemPerAccount.");
         }
         param1.writeInt(this.maxItemPerAccount);
         param1.writeInt(this.npcContextualId);
         if(this.unsoldDelay < 0)
         {
            throw new Error("Forbidden value (" + this.unsoldDelay + ") on element unsoldDelay.");
         }
         param1.writeShort(this.unsoldDelay);
      }
      
      public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_SellerBuyerDescriptor(param1);
      }
      
      public function deserializeAs_SellerBuyerDescriptor(param1:IDataInput) : void
      {
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc2_:uint = param1.readUnsignedShort();
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1.readInt();
            if(_loc6_ < 0)
            {
               throw new Error("Forbidden value (" + _loc6_ + ") on elements of quantities.");
            }
            this.quantities.push(_loc6_);
            _loc3_++;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = param1.readInt();
            if(_loc7_ < 0)
            {
               throw new Error("Forbidden value (" + _loc7_ + ") on elements of types.");
            }
            this.types.push(_loc7_);
            _loc5_++;
         }
         this.taxPercentage = param1.readFloat();
         this.maxItemLevel = param1.readInt();
         if(this.maxItemLevel < 0)
         {
            throw new Error("Forbidden value (" + this.maxItemLevel + ") on element of SellerBuyerDescriptor.maxItemLevel.");
         }
         this.maxItemPerAccount = param1.readInt();
         if(this.maxItemPerAccount < 0)
         {
            throw new Error("Forbidden value (" + this.maxItemPerAccount + ") on element of SellerBuyerDescriptor.maxItemPerAccount.");
         }
         this.npcContextualId = param1.readInt();
         this.unsoldDelay = param1.readShort();
         if(this.unsoldDelay < 0)
         {
            throw new Error("Forbidden value (" + this.unsoldDelay + ") on element of SellerBuyerDescriptor.unsoldDelay.");
         }
      }
   }
}
