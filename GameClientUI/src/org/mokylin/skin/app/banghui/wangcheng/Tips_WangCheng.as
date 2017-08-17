package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_WangCheng extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grpicon1:feathers.controls.Group;

		public var grpicon2:feathers.controls.Group;

		public var icon1_1:feathers.controls.UIAsset;

		public var icon2_1:feathers.controls.UIAsset;

		public var imgBG:feathers.controls.UIAsset;

		public var imgLine1:feathers.controls.UIAsset;

		public var imgLine2:feathers.controls.UIAsset;

		public var imgLine3:feathers.controls.UIAsset;

		public var lbJiangli:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbRoleName:feathers.controls.Label;

		public var lbTeamName:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbVsBang:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_WangCheng()
		{
			super();
			
			this.currentState = "normal";
			this.height = 406;
			this.width = 240;
			this.elementsContent = [imgBG_i(),imgLine1_i(),imgLine2_i(),imgLine3_i(),lbName_i(),__Tips_WangCheng_Label1_i(),__Tips_WangCheng_Label2_i(),__Tips_WangCheng_Label3_i(),__Tips_WangCheng_Label4_i(),__Tips_WangCheng_Label5_i(),__Tips_WangCheng_Label6_i(),lbVsBang_i(),lbTime_i(),lbJiangli_i(),lbTeamName_i(),lbRoleName_i(),grpicon1_i(),grpicon2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_WangCheng_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "占领帮派：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 48;
			return temp;
		}

		private function __Tips_WangCheng_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮主名称：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 68;
			return temp;
		}

		private function __Tips_WangCheng_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "占领福利（官员）：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 10;
			temp.y = 104;
			return temp;
		}

		private function __Tips_WangCheng_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "占领福利（帮众）：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 10;
			temp.y = 184;
			return temp;
		}

		private function __Tips_WangCheng_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "下次争夺帮派：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 10;
			temp.y = 277;
			return temp;
		}

		private function __Tips_WangCheng_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "下次争时间：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 10;
			temp.y = 322;
			return temp;
		}

		private function grpicon1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpicon1 = temp;
			temp.name = "grpicon1";
			temp.x = 12;
			temp.y = 125;
			temp.elementsContent = [icon1_1_i()];
			return temp;
		}

		private function grpicon2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpicon2 = temp;
			temp.name = "grpicon2";
			temp.x = 12;
			temp.y = 205;
			temp.elementsContent = [icon2_1_i()];
			return temp;
		}

		private function icon1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1_1 = temp;
			temp.name = "icon1_1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon2_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2_1 = temp;
			temp.name = "icon2_1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 406;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 240;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine1 = temp;
			temp.name = "imgLine1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 220;
			temp.x = 11;
			temp.y = 39;
			return temp;
		}

		private function imgLine2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine2 = temp;
			temp.name = "imgLine2";
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 220;
			temp.x = 11;
			temp.y = 94;
			return temp;
		}

		private function imgLine3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine3 = temp;
			temp.name = "imgLine3";
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 220;
			temp.x = 11;
			temp.y = 367;
			return temp;
		}

		private function lbJiangli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJiangli = temp;
			temp.name = "lbJiangli";
			temp.text = "点击领取奖励";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 173;
			temp.x = 34;
			temp.y = 377;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 16;
			temp.text = "【王城】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 111;
			temp.x = 4;
			temp.y = 10;
			return temp;
		}

		private function lbRoleName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRoleName = temp;
			temp.name = "lbRoleName";
			temp.text = "玩家名称六字";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 145;
			temp.x = 78;
			temp.y = 68;
			return temp;
		}

		private function lbTeamName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTeamName = temp;
			temp.name = "lbTeamName";
			temp.text = "帮派名称七个字";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 145;
			temp.x = 78;
			temp.y = 48;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "2017年6月13日20时00分";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 224;
			temp.x = 10;
			temp.y = 341;
			return temp;
		}

		private function lbVsBang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbVsBang = temp;
			temp.name = "lbVsBang";
			temp.text = "帮派名称一个字VS帮派名称七个字";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 224;
			temp.x = 10;
			temp.y = 297;
			return temp;
		}

	}
}