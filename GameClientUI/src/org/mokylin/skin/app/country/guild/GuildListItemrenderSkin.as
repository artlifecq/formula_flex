package org.mokylin.skin.app.country.guild
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildListItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var fanrongdu:feathers.controls.Label;

		public var leader:feathers.controls.Label;

		public var level:feathers.controls.Label;

		public var name:feathers.controls.Label;

		public var reqJoin:feathers.controls.Button;

		public var societyNum:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildListItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 29;
			this.elementsContent = [bg_i(),name_i(),leader_i(),level_i(),societyNum_i(),fanrongdu_i(),reqJoin_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 29;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 867;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function fanrongdu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fanrongdu = temp;
			temp.name = "fanrongdu";
			temp.text = "家族名称七个字";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 112;
			temp.x = 613;
			temp.y = 5;
			return temp;
		}

		private function leader_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			leader = temp;
			temp.name = "leader";
			temp.text = "家族名称七个字";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 126;
			temp.x = 196;
			temp.y = 5;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.text = "家族名称七个字";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 112;
			temp.x = 356;
			temp.y = 5;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.text = "家族名称七个字";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 126;
			temp.x = 42;
			temp.y = 5;
			return temp;
		}

		private function reqJoin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			reqJoin = temp;
			temp.name = "reqJoin";
			temp.height = 20;
			temp.label = "申请入帮";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 80;
			temp.x = 763;
			temp.y = 3;
			return temp;
		}

		private function societyNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			societyNum = temp;
			temp.name = "societyNum";
			temp.text = "家族名称七个字";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 112;
			temp.x = 476;
			temp.y = 5;
			return temp;
		}

	}
}