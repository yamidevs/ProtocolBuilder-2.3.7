package com.ankamagames.dofus.network.types.game.guild.tax
{
   import com.ankamagames.dofus.network.types.game.fight.ProtectedEntityWaitingForHelpInfo;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.INetworkType;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   
   public class TaxCollectorInformationsInWaitForHelpState extends TaxCollectorInformations implements INetworkType
   {
      
      public static const protocolId:uint = 166;
       
      
      public var waitingForHelpInfo:ProtectedEntityWaitingForHelpInfo;
      
      public function TaxCollectorInformationsInWaitForHelpState()
      {
         this.waitingForHelpInfo = new ProtectedEntityWaitingForHelpInfo();
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 166;
      }
      
      public function initTaxCollectorInformationsInWaitForHelpState(param1:int = 0, param2:uint = 0, param3:uint = 0, param4:AdditionalTaxCollectorInformations = null, param5:int = 0, param6:int = 0, param7:uint = 0, param8:int = 0, param9:EntityLook = null, param10:uint = 0, param11:Number = 0, param12:uint = 0, param13:uint = 0, param14:ProtectedEntityWaitingForHelpInfo = null) : TaxCollectorInformationsInWaitForHelpState
      {
         super.initTaxCollectorInformations(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
         this.waitingForHelpInfo = param14;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.waitingForHelpInfo = new ProtectedEntityWaitingForHelpInfo();
      }
      
      override public function serialize(param1:IDataOutput) : void
      {
         this.serializeAs_TaxCollectorInformationsInWaitForHelpState(param1);
      }
      
      public function serializeAs_TaxCollectorInformationsInWaitForHelpState(param1:IDataOutput) : void
      {
         super.serializeAs_TaxCollectorInformations(param1);
         this.waitingForHelpInfo.serializeAs_ProtectedEntityWaitingForHelpInfo(param1);
      }
      
      override public function deserialize(param1:IDataInput) : void
      {
         this.deserializeAs_TaxCollectorInformationsInWaitForHelpState(param1);
      }
      
      public function deserializeAs_TaxCollectorInformationsInWaitForHelpState(param1:IDataInput) : void
      {
         super.deserialize(param1);
         this.waitingForHelpInfo = new ProtectedEntityWaitingForHelpInfo();
         this.waitingForHelpInfo.deserialize(param1);
      }
   }
}
