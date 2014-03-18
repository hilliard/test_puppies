class FramesPage
  include PageObject

  page_url "http://localhost:3000/frames.html"
  #page_url "http://puppies.herokuapp.com/frames.html"

  in_frame(:id => 'frame_1') do |frame|
    text_field(:sender, :id => 'senderElement', :frame => frame)
    button(:send_to_receiver, :id => 'send', :frame => frame)
  end

  in_frame(:id => 'frame_2') do |frame|
    text_field(:receiver, :name => 'recieverElement', :frame => frame)
  end

  in_frame(:id => 'frame_3') do |frame|
    link(:popup_window, :text => 'Popup Window', :frame => frame)
  end


  def send_message(message)
    self.sender = message
    send_to_receiver
  end


  def alert_text
    in_frame(:id => 'frame_3') do |frame|
      @alert_text = alert(frame) do
        button_element(:id => 'alert_button', :frame => frame).click
      end
    end
    @alert_text
  end

  def confirm_text
    in_frame(:id => 'frame_3') do |frame|
      @confirm_text = confirm(true, frame) do
        button_element(:id => 'confirm_button', :frame => frame).click
      end
    end
    @confirm_text
  end

  def popup_a_window
     popup_window
     attach_to_window(:title => 'Success')
  end

  def return_from_popup
    attach_to_window(:title => 'Frames')
    attach_to_window(:title => 'Success') do
    button_element(:value => 'Close Window').click
    end
  end

 # def prompt_value(value)
 #   in_frame(:id => 'frame_3') do |frame|
 #     @prompt_response = prompt(value, frame) do
 #       button_element(:id => 'prompt_button', :frame => frame).click
 #     end
 #   end
 #   @prompt_response
 # end

  def prompt_value(value)
     in_frame(:id => 'frame_3') do |frame|
        @prompt_response = prompt(value, frame) do
          button_element(:id => 'prompt_button', :frame => frame).click
         end
     end
     @prompt_response
  end

end