package org.mokylin.skin.app.npc
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class npc_jiangli_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var lbl_details:feathers.controls.Label;

		public var lbl_npcName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function npc_jiangli_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 233;
			this.width = 694;
			this.elementsContent = [__npc_jiangli_Skin_UIAsset1_i(),__npc_jiangli_Skin_UIAsset2_i(),btnClose_i(),btn_ok_i(),lbl_npcName_i(),lbl_details_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __npc_jiangli_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/npc/renwukuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __npc_jiangli_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/npc/rwjl.png";
			temp.x = 256;
			temp.y = 104;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 660;
			temp.y = 6;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "领取奖励";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 108;
			temp.x = 547;
			temp.y = 171;
			return temp;
		}

		private function lbl_details_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_details = temp;
			temp.name = "lbl_details";
			temp.height = 113;
			temp.text = "内容";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 366;
			temp.x = 259;
			temp.y = 49;
			return temp;
		}

		private function lbl_npcName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_npcName = temp;
			temp.name = "lbl_npcName";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "npc名字:";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 392;
			temp.x = 259;
			temp.y = 18;
			return temp;
		}

	}
}