package org.mokylin.skin.app.fengcehuodong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FengCe_YuanBao extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbData:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FengCe_YuanBao()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FengCe_YuanBao_UIAsset1_i(),lbData_i(),__FengCe_YuanBao_Label1_i(),lbTime_i(),__FengCe_YuanBao_Label2_i(),__FengCe_YuanBao_Label3_i(),__FengCe_YuanBao_Label4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FengCe_YuanBao_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前已累积获得公测元宝：";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 209;
			temp.x = 314;
			temp.y = 99;
			return temp;
		}

		private function __FengCe_YuanBao_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "活动说明：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 96;
			temp.y = 298;
			return temp;
		}

		private function __FengCe_YuanBao_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "1.累计的公测元宝数量，以活动时间截止时数量为准";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 94;
			temp.y = 331;
			return temp;
		}

		private function __FengCe_YuanBao_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "2.累计获得的公测元宝与当前账号绑定，请牢记账号，否则将无法领取累积公测元宝";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 94;
			temp.y = 358;
			return temp;
		}

		private function __FengCe_YuanBao_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/fengcehuodong/yuanbao_bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbData_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbData = temp;
			temp.name = "lbData";
			temp.htmlText = "剩余时间：<font color='#ffea00'>3天3小时12分钟</font>";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 209;
			temp.x = 10;
			temp.y = 9;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.fontSize = 16;
			temp.text = "888";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 78;
			temp.x = 480;
			temp.y = 98;
			return temp;
		}

	}
}