        $(document).ready(function(){
            $('.menu-container').hover(
                function(){
                    $('.profile-actions').slideDown('fast');
                  $('.list-icon').addClass('active');
                },
                function(){
                    $('.profile-actions').slideUp('fast');
                  $('.list-icon').removeClass('active');
                }
            );
            $('.profile-card').mouseleave(function(){
                $('.profile-actions').slideUp('fast');
                $('.profile-info').slideUp('fast');
                $('.profile-map').slideUp('fast');
            });

            $('.profile-avatar').hover(
                function(){
                    $('.profile-links').fadeIn('fast');
                },
                function(){
                    $('.profile-links').hide();
                }
            );
            $('.read-more').click(function(){
                $('.profile-map').slideUp('fast');
                $('.profile-info').slideToggle('fast');
                return false;
            });
            $('.view-map').click(function(){
                $('.profile-info').slideUp('fast');
                $('.profile-map').slideToggle('fast');
                return false;
            });
        });